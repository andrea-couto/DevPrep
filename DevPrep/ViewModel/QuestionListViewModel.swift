//
//  QuestionListViewModel.swift
//  DevPrep
//
//  Created by Andy Couto on 11/27/22.
//

import Foundation
import SwiftUI

extension QuestionListView
{
    
    /// The main actor is responsible for running all user interface updates, and adding that attribute to the class means we want all its code – any time it runs anything, unless we specifically ask otherwise – to run on that main actor.
    /// we’re telling Swift every part of this class should run on the main actor, so it’s safe to update the UI, no matter where it’s used.
    @MainActor class ViewModel: ObservableObject, DocumentDirectoryFinder
    {
        // var questions: [Question] = QuestionList.questions
        var groupedQuestions: Dictionary<String, [Question]> = QuestionList.groupedQuestions
        
        func saveResponse(for id: Int, response: String)
        {
            guard !response.isEmpty else { return }
            createFolderIfNeeded()
            let dirPath = getDocumentsDirectory().appendingPathComponent("QuestionResponses", isDirectory: true)
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
            let dirPath = getDocumentsDirectory().appendingPathComponent("QuestionResponses", isDirectory: true)
            let filePath = dirPath.appendingPathComponent("QuestionResponseForId\(id).txt")
            if FileManager.default.fileExists(atPath: dirPath.path)
            {
                do {
                    let response = try String(contentsOf: filePath, encoding: .utf8)
                    return response
                } catch {
                    print(error.localizedDescription)
                    return nil
                }
            }
            return nil
        }
        
        private func createFolderIfNeeded()
        {
            let dirPath = getDocumentsDirectory().appendingPathComponent("QuestionResponses", isDirectory: true)
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

