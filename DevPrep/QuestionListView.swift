//
//  ContentView.swift
//  DevPrep
//
//  Created by Andy Couto on 11/26/22.
//

import SwiftUI

struct QuestionListView: View
{
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        NavigationStack
        {
            List
            {
                ForEach(Array(viewModel.groupedQuestions), id: \.key)
                {
                    key, value
                    in
                    Section(header: Text(key))
                    {
                        ForEach(value, id: \.id)
                        {
                            question
                            in
                            NavigationLink(value: question)
                            {
                                HStack(spacing: 20)
                                {
                                    question.type.icon
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 20)
                                        .cornerRadius(4)
                                    Text(question.ask)
                                        .fontWeight(.semibold)
                                        .lineLimit(3)
                                        .minimumScaleFactor(0.5)
                                }
                                .frame(height: 70)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Questions")
            .navigationDestination(for: Question.self)
            {
                question
                in
                QuestionDetailView(question: question, viewModel: viewModel)
            }
        }
    }
}

struct QuestionDetailView: View
{
    let question: Question
    @State private var response: String = ""
    
    var viewModel: QuestionListView.ViewModel
    
    var body: some View
    {
        VStack {
            Text(question.answer)
                .font(.body)
            .padding(.all)
            TextField("Response", text: $response, axis: .vertical)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all)
            HStack
            {
                Spacer()
                Button("Save") {
                    viewModel.saveResponse(for: question.id, response: response)
                }
                .padding(.trailing)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        QuestionListView()
    }
}
