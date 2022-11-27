//
//  QuestionList.swift
//  DevPrep
//
//  Created by Andy Couto on 11/26/22.
//

import Foundation

struct QuestionList
{
    static var groupedQuestions: Dictionary<String, [Question]>
    {
        return Dictionary(grouping: questions, by: { $0.type.rawValue })
    }
    
    static var sectionNames: [String]
    {
        return Array(groupedQuestions.keys)
    }
    
    static let questions = [
        // MARK: - behavioral
        Question(id: 1,
                 type: .behavioral,
                 ask: "Tell me about yourself.",
                 answer: "You’ll be asked to talk about yourself and how you got in to programming. Do your best to weave a narrative that reinforces, in a positive light, how you got here today and why you would be a great fit for the job."),
        Question(id: 2,
                 type: .behavioral,
                 ask: "Tell me about a time you made a mistake that made an impact in production. How did you resolve the problem?",
                 answer: "You can use this question to demonstrate your communication and critical thinking skills under pressure. You can also use it to showcase your integrity and ability to admit and correct your mistakes."),
        
        // MARK: - accessibility
        Question(id: 3,
                 type: .accessibility,
                 ask: "Describe your experience making apps more accessible.",
                 answer: "Have you supported dynamic type for fonts? Added text/icons to describe something communicated with color? Added accessibility labels? Increased the tappable area of a button? For more on how to make apps more accessible see Apple's HIG on accessibility:  https://developer.apple.com/design/human-interface-guidelines/foundations/accessibility/")
    ]
}
