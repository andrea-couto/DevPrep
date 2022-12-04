//
//  CreateYourOwnQuestionViewModel.swift
//  DevPrep
//
//  Created by Andy Couto on 12/1/22.
//

import Foundation

enum SavingCustomQuestionResult
{
    case success
    case questionEmpty
    case documentSavingIssue
}

extension CreateYourOwnQuestion
{
    @MainActor class ViewModel: ObservableObject, DocumentDirectoryFinder
    {
        func saveQuestion(question: String, answer: String, filter: QuestionType) -> SavingCustomQuestionResult
        {
            guard !question.isEmpty else
            {
                return .questionEmpty
            }
            
            let id = customQuestionCount()
            
            var question = Question(id: id,
                                    type: filter,
                                    ask: question,
                                    answer: answer)
            question.userAdded = true
            
            createFolderIfNeeded()
            let dirPath = getDocumentsDirectory().appendingPathComponent("CustomQuestions", isDirectory: true)
            let url = dirPath.appendingPathComponent("CustomQuestionForId\(id).txt")
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(question)
                if FileManager.default.fileExists(atPath: url.path) {
                    try FileManager.default.removeItem(at: url)
                }
                FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
            } catch {
                print(error.localizedDescription)
            }
            return .success
        }
        
        private func customQuestionCount() -> Int
        {
            let dirPath = getDocumentsDirectory().appendingPathComponent("CustomQuestions", isDirectory: true)
            let dirContents = try? FileManager.default.contentsOfDirectory(atPath: dirPath.path)
            return dirContents?.count ?? 0
        }
        
        private func createFolderIfNeeded()
        {
            let dirPath = getDocumentsDirectory().appendingPathComponent("CustomQuestions", isDirectory: true)
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
