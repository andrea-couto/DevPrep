//
//  UserQuestionListView.swift
//  DevPrep
//
//  Created by Andy Couto on 12/1/22.
//

import SwiftUI

struct UserQuestionListView: View
{
    @StateObject private var viewModel = ViewModel()
    @State private var isExpanded = false
    @State private var selectedFilter: QuestionType = .all

    var body: some View
    {
        NavigationStack
        {
            List
            {
                Section(header: Text("Filter"))
                {
                    DisclosureGroup("\(selectedFilter.rawValue)", isExpanded: $isExpanded)
                    {
                        VStack
                        {
                            ForEach(QuestionType.allCases, id: \.rawValue)
                            {
                                item in
                                Text(item.rawValue)
                                    .padding(.all)
                                    .onTapGesture
                                    {
                                        self.selectedFilter = item
                                        withAnimation
                                        {
                                            self.isExpanded.toggle()
                                        }
                                    }
                            }
                        }
                    }
                }
                
                ForEach(Array(viewModel.getQuestionsForSelection(questiontype: selectedFilter)), id: \.key)
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
            .onAppear()
            {
                viewModel.refreshQuestions()
            }
            .navigationTitle("Your Questions")
            .toolbar {
                NavigationLink {
                    CreateYourOwnQuestion()
                } label: {
                    Text("Add")
                }
            }
            .navigationDestination(for: Question.self)
            {
                question
                in
                QuestionDetailView(question: question)
            }
        }
    }
}

struct UserQuestionListView_Previews: PreviewProvider {
    static var previews: some View {
        UserQuestionListView()
    }
}
