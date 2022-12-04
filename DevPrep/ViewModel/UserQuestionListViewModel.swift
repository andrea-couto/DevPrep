//
//  UserQuestionListViewModel.swift
//  DevPrep
//
//  Created by Andy Couto on 12/1/22.
//

import Foundation

extension UserQuestionListView
{
    @MainActor class ViewModel: ObservableObject, DocumentDirectoryFinder
    {
        @Published var questions: [Question] = []
        
        var groupedQuestions: Dictionary<String, [Question]>
        {
            return Dictionary(grouping: questions, by: { $0.type.rawValue })
        }
        
        func refreshQuestions()
        {
            questions = getQuestionList()
        }
        
        func saveResponse(for id: Int, response: String)
        {
            guard !response.isEmpty else { return }
            createFolderIfNeeded()
            let dirPath = getDocumentsDirectory().appendingPathComponent("CustomQuestionResponses", isDirectory: true)
            let url = dirPath.appendingPathComponent("QuestionResponseForId\(id).txt")
            do {
                try response.write(to: url, atomically: true, encoding: .utf8)
                let input = try String(contentsOf: url)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        func getQuestionsForSelection(questiontype: QuestionType?) -> Dictionary<String, [Question]>
        {
            guard let questiontype = questiontype,
                  !(questiontype == .all),
                  let questions = groupedQuestions[questiontype.rawValue] else { return groupedQuestions }
            return [questiontype.rawValue: questions]
        }
        
        func getResponse(for id: Int) -> String?
        {
            let dirPath = getDocumentsDirectory().appendingPathComponent("CustomQuestionResponses", isDirectory: true)
            let filePath = dirPath.appendingPathComponent("QuestionResponseForId\(id).txt")
            do {
                let response = try String(contentsOf: filePath, encoding: .utf8)
                return response
            } catch {
                print(error.localizedDescription)
                return nil
            }
        }
        
        private func getQuestionList() -> [Question]
        {
            let dirPath = getDocumentsDirectory().appendingPathComponent("CustomQuestions", isDirectory: true)
            let dirContents = try? FileManager.default.contentsOfDirectory(atPath: dirPath.path)
            
            var quests = [Question]()
            let decoder = JSONDecoder()
            for filePath in dirContents ?? []
            {
                if let data = try? Data(contentsOf: dirPath.appendingPathComponent(filePath))
                {
                    if let question = try? decoder.decode(Question.self, from: data)
                    {
                        quests.append(question)
                    }
                }
            }
            return quests
        }
        
        private func createFolderIfNeeded()
        {
            let dirPath = getDocumentsDirectory().appendingPathComponent("CustomQuestionResponses", isDirectory: true)
            if !FileManager.default.fileExists(atPath: dirPath.path)
            {
                do
                {
                    try FileManager.default.createDirectory(atPath: dirPath.path,
                                                            withIntermediateDirectories: true,
                                                            attributes: nil)
                }
                catch let error as NSError
                {
                    print("Unable to create directory \(error.debugDescription)")
                }
            }
        }
    }
}
