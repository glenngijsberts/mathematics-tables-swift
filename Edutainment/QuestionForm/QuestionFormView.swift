//
//  QuestionFormView.swift
//  Edutainment
//
//  Created by Glenn Gijsberts on 06/09/2020.
//  Copyright © 2020 Glenn Gijsberts. All rights reserved.
//

import SwiftUI

struct QuestionFormView: View {
    @EnvironmentObject var questionData: QuestionData
    
    func reset() {
        questionData.resetScore()
        questionData.stopGame()
    }
    
    func checkAnswer() {
        if (questionData.checkAnswer()) {
            
            questionData.questionScore += 1
            
            if (questionData.hasNextQuestion()) {
                questionData.resetAnswer()
                return questionData.currentQuestion += 1
            } else {
                return questionData.showScoreAlert = true
            }
        } else {
            if (questionData.hasNextQuestion()) {
                questionData.resetAnswer()
                return questionData.currentQuestion += 1
            } else {
                return questionData.showScoreAlert = true
            }
        }
    }
    
    var body: some View {
        Group {
            Text(questionData.questions[questionData.currentQuestion].question)
                .foregroundColor(.gray)
                .font(.headline)
            
            TextField("", text: $questionData.answer)
                .keyboardType(.numberPad)
                .padding(.leading, 16)
                .padding(.trailing, 16)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            Button(action: {
                if self.questionData.answer.count < 1 { return }
                
                self.checkAnswer()
            }) {
                HStack {
                    Spacer()
                    Text("Submit").font(.headline)
                    Spacer()
                }
                .padding(14)
            }
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(16)
        }.alert(isPresented: $questionData.showScoreAlert) {
            Alert(title: Text("Done"), message: Text("Your score is \(self.questionData.questionScore) out of \(self.questionData.questions.count) questions"), dismissButton: .default(Text("Leave game")) {
                self.reset()
                })
        }
    }
}
