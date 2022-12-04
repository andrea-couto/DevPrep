//
//  CreateYourOwnQuestion.swift
//  DevPrep
//
//  Created by Andy Couto on 12/1/22.
//

import SwiftUI
import AlertToast

struct CreateYourOwnQuestion: View
{
    @State private var question: String = ""
    @State private var description: String = ""
    @State private var selectedFilter: QuestionType = .all
    @State private var isExpanded = false
    @State private var showToast = false
    
    @StateObject private var viewModel = ViewModel()
    @Environment(\.dismiss) var dismiss

    var body: some View
    {
        ScrollView
        {
            HStack
            {
                Text("Filter")
                Spacer()
                Picker("Please choose a filter", selection: $selectedFilter)
                {
                    ForEach(QuestionType.allCases, id: \.self)
                    {
                        Text($0.rawValue)
                     }
                 }
            }
            .padding(.all)
            
            TextField("Question", text: $question, axis: .vertical)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all)
            TextField("Description", text: $description, axis: .vertical)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all)
            
            HStack
            {
                Spacer()
                Button("Save")
                {
                    let result = viewModel.saveQuestion(question: question,
                                                        answer: description,
                                                        filter: selectedFilter)
                    if result == .success
                    {
                        showToast = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1)
                        {
                            dismiss()
                        }
                    }
                }
                .padding(.trailing)
            }
        }
        .navigationTitle("Create Your Own Question")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.all)
        .toast(isPresenting: $showToast)
        {
            AlertToast(type: .complete(Color("devPrepDarkGreen")), title: "Saved!")
        }
    }
}

struct CreateYourOwnQuestion_Previews: PreviewProvider {
    static var previews: some View {
        CreateYourOwnQuestion()
    }
}
