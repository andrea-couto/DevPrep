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
    @MainActor class ViewModel: ObservableObject
    {
        // var questions: [Question] = QuestionList.questions
        var groupedQuestions: Dictionary<String, [Question]> = QuestionList.groupedQuestions
        
        func saveResponse(for id: Int, response: String)
        {
            guard !response.isEmpty else { return }
            let url = getDocumentsDirectory().appendingPathComponent("QuestionResponseForId\(id).txt")

            do {
                try response.write(to: url, atomically: true, encoding: .utf8)
                let input = try String(contentsOf: url)
                print(input)
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
            let filePath = getDocumentsDirectory().appendingPathComponent("QuestionResponseForId\(id).txt")
            do {
                let response = try String(contentsOf: filePath, encoding: .utf8)
                print(response)
                return response
            } catch {
                print(error.localizedDescription)
                return nil
            }
        }
        
        private func getDocumentsDirectory() -> URL
        {
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return paths[0]
        }
    }
    
}

