//
//  QuestionDetailView.swift
//  DevPrep
//
//  Created by Andy Couto on 11/27/22.
//

import SwiftUI
import AlertToast

struct QuestionDetailView: View
{
    @AppStorage("showDescription") var showDescription = true

    let question: Question
    @StateObject private var viewModel = QuestionListView.ViewModel()
    @Environment(\.dismiss) var dismiss

    @State private var response: String = ""
    @State private var showToast = false
    
    var body: some View
    {
        ScrollView
        {
            Text(question.ask)
                .font(.headline)
                .padding(.all)
            if showDescription
            {
                Text(question.answer)
                    .font(.body)
                .padding(.all)
            }
            
            TextField("Your Notes (saved on your device)", text: $response, axis: .vertical)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all)
            HStack
            {
                Spacer()
                Button("Save")
                {
                    viewModel.saveResponse(for: question.id, response: response)
                    showToast = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1)
                    {
                        dismiss()
                    }
                }
                .padding(.trailing)
            }
            
            Spacer()
        }
        .toast(isPresenting: $showToast) {
            AlertToast(type: .complete(Color("devPrepDarkGreen")), title: "Saved!")
        }
        .onAppear()
        {
            response = viewModel.getResponse(for: question.id) ?? ""
        }
        .onDisappear()
        {
            viewModel.saveResponse(for: question.id, response: response)
        }
    }
}

struct QuestionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let question = Question(id: 9,
                                type: .behavioral,
                                ask: "What do you know about the role/company?",
                                answer: "Be prepared to research the role and the company before the interview. Having a good answer to this question shows you have a genuine interest in pursuing the position.")
        QuestionDetailView(question: question)
    }
}
