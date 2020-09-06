//
//  ContentView.swift
//  Edutainment
//
//  Created by Glenn Gijsberts on 04/09/2020.
//  Copyright © 2020 Glenn Gijsberts. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var questionData: QuestionData

    
    var body: some View {
        print(questionData.questions)
        
        return NavigationView {
            Group {
                if !questionData.gameStarted {
                    QuestionConfigView()
                } else {
                    QuestionFormView()
                }
            }
            .navigationBarTitle(Text("Math tables"))
            .navigationBarItems(leading:
                Button(action: {
                    self.questionData.gameStarted ? self.questionData.stopGame() : self.questionData.startGame()
                }) {
                    Text(questionData.gameStarted ? "Stop" : "Start").foregroundColor(Color.orange)
                }
                
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
