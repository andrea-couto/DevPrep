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
            // TODO:
            print("id: \(id)")
            print("response: \(response)")
        }
    }
}

