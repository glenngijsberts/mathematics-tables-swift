//
//  QuestionConfigView.swift
//  Edutainment
//
//  Created by Glenn Gijsberts on 04/09/2020.
//  Copyright © 2020 Glenn Gijsberts. All rights reserved.
//

import SwiftUI

struct QuestionConfigView: View {
    @EnvironmentObject var questionData: QuestionData
    
    var body: some View {
        Group {
            VStack(alignment: .leading) {
                Text("Pick a table").font(.headline)
                Stepper(value: $questionData.table, in: 1...20, step: 1) {
                    Text("\(questionData.table)")
                }
            }.padding(16)
            
            VStack(alignment: .leading) {
                Text("Difficulty").font(.headline)
                
                Picker(selection: $questionData.diffuculty, label: Text("Difficulty")) {
                    Text("5 tables").tag(5)
                    Text("10 tables").tag(10)
                    Text("15 tables").tag(15)
                    Text("20 tables").tag(20)
                }.pickerStyle(SegmentedPickerStyle())
                
            }.padding(16)
            
            Button(action: {
                self.questionData.gameStarted ? self.questionData.stopGame() : self.questionData.startGame()
            }) {
                HStack {
                    Spacer()
                    Text("Start").font(.headline)
                    Spacer()
                }
                .padding(14)
            }
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(16)
            
            Spacer()
        }
    }
}

//struct ConfigView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionConfigView()
//    }
//}
