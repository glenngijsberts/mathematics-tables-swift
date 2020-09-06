//
//  QuestionData.swift
//  Edutainment
//
//  Created by Glenn Gijsberts on 04/09/2020.
//  Copyright © 2020 Glenn Gijsberts. All rights reserved.
//

import SwiftUI
import Combine

final class QuestionData: ObservableObject {
    @Published var table: Int = 1
    @Published var diffuculty: Int = 5
    
    @Published var gameStarted: Bool = false
    @Published var questions: [Question] = [Question]()
    
    @Published var currentQuestion = 0
    @Published var answer: String = ""
    
    @Published var showScoreAlert: Bool = false
    @Published var questionScore = 0
    
    func checkAnswer() -> Bool {
        if (Int(answer) == questions[currentQuestion].answer) {
            return true
        }
        
        return false
    }
    
    func hasNextQuestion() -> Bool {
        if currentQuestion < diffuculty {            
            return true
        }
        
        return false
    }
    
    func resetAnswer() {
        answer = ""
    }
    
    func resetScore() {
        currentQuestion = 0
        questionScore = 0
    }
    
    func stopGame() {
        resetAnswer()
        resetScore()
        questions.removeAll()
        gameStarted.toggle()
    }
    
    
    func startGame() {
        let quantity = diffuculty

        for number in 0...quantity {
            questions.append(.init(question: "What is \(table) x \(number)?", answer: table * number))
        }
        
        gameStarted.toggle()
    }
}
