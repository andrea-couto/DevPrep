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
        
        // MARK: - dataPersistence
        
        Question(id: 20,
                 type: .dataPersistence,
                 ask: "Describe managed object context and its function.",
                 answer: "A managed object context (represented by an instance of NSManagedObjectContext) is a temporary ‘scratchpad’ in an application for a (presumably) related collection of objects. These objects collectively represent an internally consistent view of one or more persistent stores. A single-managed object instance exists in one and only one context, but multiple copies of an object can exist in different contexts. \n\nThe key functions of the managed object context include the following: \n1. Life-cycle management: Here, the context provides validation, inverse relationship handling, and undo/redo. \n2. Notifications: It refers to context posts’ notifications at various points that can be optionally monitored elsewhere in our application. \n3. Concurrency: Here, the Core Data uses thread (or serialized queue) confinement to protect managed objects and managed object contexts."),
        
        // MARK: - uiKit
        
        Question(id: 30,
                 type: .uiKit,
                 ask: "Differentiate between a frame and a bound?",
                 answer: "A UIView’s bounds are a rectangle with a size (width, height) and position (x,y) relative to its own coordinate system (0,0). A UIView’s frame is a rectangle with a scale (width, height) and position (x,y) relative to the superview it is located within."),
        
        // MARK: - designPatterns

        Question(id: 40,
                 type: .designPatterns,
                 ask: "What is the difference between KVC and KVO?",
                 answer: "KVC (Key-Value Coding) is a method for accessing an object’s properties using strings at runtime rather than needing to know the property names statically at development time. Example: Interface Builder and how it links IBOutlets. \n\nKVO (Key-Value Observing) allows a controller or class to monitor changes in a property value. In KVO, an object may request to be informed of any adjustments to a particular property, and the observer is automatically notified if that property’s value changes."),
        Question(id: 41,
                 type: .designPatterns,
                 ask: "What is a Singleton? What are its disadvantages.",
                 answer: "When only one instance of a class is created in the application. Disadvantage examples: Due to coupling it can make code harder to test. Singletons can also make it harder to test because they can't easily start from a 'clean slate'. "),
        Question(id: 41,
                 type: .designPatterns,
                 ask: "What is the observer pattern?",
                 answer: "In the Observer pattern, one object notifies other objects of any state changes. \n\nCocoa implements the observer pattern in two ways: Notifications and Key-Value Observing (KVO)."),
        
        // MARK: - performance

        Question(id: 50,
                 type: .performance,
                 ask: "What is the difference between synchronous & asynchronous tasks?",
                 answer: "Synchronous means tasks are completed in order one at a time. Asynchronous means tasks can be completed in any order and multiple tasks can be completed at the same time."),
        Question(id: 51,
                 type: .performance,
                 ask: "What is Concurrency?",
                 answer: "Concurrency is a means running several tasks at the same time. On iOS devices, concurrency is commonly used to allow you to run tasks such as downloading or processing data in the background while keeping your user interface lag-free."),
        Question(id: 52,
                 type: .performance,
                 ask: "Name a few ways you can achieve concurrency on iOS.",
                 answer: "Grand Central Dispatch. OperationQueue. Threads"),
        Question(id: 53,
                 type: .performance,
                 ask: "What is a deadlock?",
                 answer: "A deadlock is a situation that occurs when at least two threads are locked on a different resource, and both are waiting for the other resource to finish its job. And no one is able to unlock the resource it is guarding."),
        
        // MARK: - Swift

        Question(id: 60,
                 type: .swift,
                 ask: "What is a Lazy property?",
                 answer: "A lazy stored property is one that does not determine its initial value until it is used for the first time. The lazy modifier is written before the declaration of a lazy stored property."),
        Question(id: 61,
                 type: .swift,
                 ask: "What is ARC?",
                 answer: "Automatic Reference Counting."),
        Question(id: 62,
                 type: .swift,
                 ask: "How can we influence the compilation process with Swift?",
                 answer: "Compiler directives, particularly the #if command, which enables us to conditionally include or exclude certain code blocks when our program is being compiled."),
        Question(id: 63,
                 type: .swift,
                 ask: "Name some properties of an NSError?",
                 answer: "Code: The error code. Domain: A string containing the error domain. UserInfo: The user info dictionary."),
        Question(id: 64,
                 type: .swift,
                 ask: "Explain the difference between strong, weak, and unowned.",
                 answer: "Strong: Strong references in Swift increment the reference count by 1. By default, references in Swift are strong meaning using var without a modifier creates a strong reference. \n\nWeak: A weak reference does not increment or decrement the reference count of an object. Since weak references do not increment the reference count of an object, a weak reference can be nil. This is because the object could be deallocated while the weak reference is pointing to it. \n\nUnowned: Like a weak reference, an unowned reference does not increment or decrement the reference count of an object. However, unlike a weak reference, the program guarantees to the Swift compiler that an unowned reference will not be nil when it is accessed. Accessing an unowned reference when the instance the reference points to is nil will cause a fatal program error."),
        Question(id: 65,
                 type: .swift,
                 ask: "What is the keyword defer used for?",
                 answer: "defer is a keyword which provides a block of code that will be executed in the case when execution is leaving the current scope."),
        Question(id: 65,
                 type: .swift,
                 ask: "Explain the difference between using a guard vs an if let.",
                 answer: "if let and guard let serve similar, but distinct purposes.\nThe 'else' case of guard must exit the current scope. Generally that means it must call return or abort the program. guard is used to provide early return without requiring nesting of the rest of the function.\n\nif let nests its scope, and does not require anything special of it. It can return or not.\n\nIn general, if the if-let block was going to be the rest of the function, or its else clause would have a return or abort in it, then you should be using guard instead. This often means (at least in my experience), when in doubt, guard is usually the better answer. But there are plenty of situations where if let still is appropriate."),
        
        Question(id: 70,
                 type: .architecture,
                 ask: "Explain each part of MVC.",
                 answer: "Models: responsible for the domain data or a data access layer which manipulates the data, think of ‘Person’ or ‘PersonDataProvider’ classes. \nViews — responsible for the presentation layer (GUI), for iOS environment think of everything starting with ‘UI’ prefix. \nController/Presenter/ViewModel — the glue or the mediator between the Model and the View, in general responsible for altering the Model by reacting to the user’s actions performed on the View and updating the View with changes from the Model."),
        Question(id: 71,
                 type: .architecture,
                 ask: "Explain each part of MVVM.",
                 answer: "Model – Acts the same as in MVC design patterns – it is used by ViewModel and updates whenever ViewModel sends a new update.\n\nViewController – It is responsible for setting up UI views. There is no direct interaction between the ViewController & Model and it no longer needs to worry about business logic. It should go through ViewModel and request for what it requires in a ready-to-display format.\n\nViewModel – It is responsible for all business logic. If the ViewController has a label, it triggers entire calls and sends & receives data. It is completely independent of the ViewController. It receives information from the ViewController, processes all this information & sends the results back to ViewController."),
        
        // MARK: - accessibility
        Question(id: 100,
                 type: .accessibility,
                 ask: "Describe your experience making apps more accessible.",
                 answer: "Have you supported dynamic type for fonts? Added text/icons to describe something communicated with color? Added accessibility labels? Increased the tappable area of a button?"),
        Question(id: 101,
                 type: .accessibility,
                 ask: "What is Dynamic Type?",
                 answer: "The Dynamic Type feature allows users to choose the size of textual content displayed on the screen."),
        Question(id: 102,
                 type: .accessibility,
                 ask: "How do you turn on voice over?",
                 answer: "Go to Settings  > Accessibility > VoiceOver.")
    ]
}
