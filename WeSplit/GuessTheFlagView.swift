//
//  GuessTheFlagView.swift
//  WeSplit
//
//  Created by Leonardo Kiszewski on 30/10/23.
//

import SwiftUI

struct GuessTheFlagView: View {
    let countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    
    @State var showAlert: Bool = false
    @State var answerIsCorrect: Bool = false
    @State var correctAnswer = Int.random(in: 0...4)
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Text("Tap the flag of")
                    .font(.headline.weight(.light))
                    .foregroundColor(.white)
                Text(countries[correctAnswer])
                    .foregroundColor(.white)
                    .font(.largeTitle.weight(.semibold))
                VStack {
                    ScrollView {
                        VStack(spacing: 15) {
                            ForEach(countries, id: \.self) { c in
                                Button {
                                    checkAnswer(answer: c)
                                } label: {
                                    Image(c)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .shadow(radius: 5)
                                }
                            }
                        }
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                    }
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                    .alert(isPresented: $showAlert, content: {
                        Alert(title: Text(answerIsCorrect ? "Answer is correct" : "Answer is incorrect"))
                    })
                    Text("Score: ???")
                        .foregroundStyle(.white)
                        .font(.title.bold())
                }
            }
        }
        
    }
    
    func checkAnswer(answer: String) {
        answerIsCorrect = countries[correctAnswer] == answer
        showAlert = true
        
        if answerIsCorrect {
            correctAnswer = Int.random(in: 0...countries.count)
        }
    }
}

#Preview {
    GuessTheFlagView()
}
