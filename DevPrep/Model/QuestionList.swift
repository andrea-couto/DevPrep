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
        Question(id: 3,
                 type: .behavioral,
                 ask: "Describe an occasion when you had to manage your time to complete a task. How did you do it?",
                 answer: "This question can appear in interviews for a variety of roles. It’s your chance to highlight your time management skills. In your answer, be sure to discuss elements such as your organization's strategies and the tools you use to stay on task and track deadlines."),
        Question(id: 4,
                 type: .behavioral,
                 ask: "Tell me about a time you went beyond the call of duty. Why did you do this, and what happened?",
                 answer: "With this commonly asked question, you can describe a specific instance when you stepped up to help another coworker, your team, a supervisor or a client or customer. This example can allow you to demonstrate your dedication to your role and your team and organization’s success. Also, it showcases qualities such as integrity, selflessness and teamwork."),
        Question(id: 5,
                 type: .behavioral,
                 ask: "Describe a time when you had to motivate coworkers.",
                 answer: "This question is likely to come up in an interview for a leadership position. Use this question to demonstrate leadership skills related to motivation and your strategies to promote productivity and success on a team."),
        Question(id: 6,
                 type: .behavioral,
                 ask: "Describe a typical day at your current position.",
                 answer: "The interviewer might want to know what your day is like when working on a project. Be able to explain how you go about it, what you use (Xcode, Postman, Jira, etc.), and also be ready to talk about some libraries you use (AFNetworking, MapKit, GoogleAnalytics, etc.)."),
        Question(id: 7,
                 type: .behavioral,
                 ask: "What are your strengths?",
                 answer: "Have a few ideas for what your strengths are in mobile development. Are you really good at time management? learning new things?"),
        Question(id: 8,
                 type: .behavioral,
                 ask: "What is your greatest weakness?",
                 answer: "The key to answering this question in your job interview is to prepare by identifying weaknesses that still communicate strengths. This will show the interviewer you’re introspective enough to know your areas of opportunity. Give an example of how you have used this weakness to grow professionally."),
        Question(id: 9,
                 type: .behavioral,
                 ask: "What do you know about the role/company?",
                 answer: "Be prepared to research the role and the company before the interview. Having a good answer to this question shows you have a genuine interest in pursuing the position."),
        
        // MARK: - accessibility
        Question(id: 100,
                 type: .accessibility,
                 ask: "Describe your experience making apps more accessible.",
                 answer: "Have you supported dynamic type for fonts? Added text/icons to describe something communicated with color? Added accessibility labels? Increased the tappable area of a button?")
    ]
}
