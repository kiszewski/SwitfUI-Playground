//
//  GuessTheFlagView.swift
//  WeSplit
//
//  Created by Leonardo Kiszewski on 30/10/23.
//

import SwiftUI

struct GuessTheFlagView: View {
    let countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    
    @State var answerIsCorrect: Bool = false
    @State var correctAnswer = Int.random(in: 0...4)
    @State var score = 0
    @State var remainingTries = 8
    
    @State var showAnswerAlert: Bool = false
    @State var answerAlertTitle: String?
    @State var answerAlertMessage: String?
    
    @State var showResultAlert: Bool = false
    
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
                                    FlagImage(c)
                                }
                            }
                        }
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                    }
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                    .alert(isPresented: $showAnswerAlert) {
                        Alert(title: Text(answerAlertTitle ?? ""), message: Text(answerAlertMessage ?? ""))
                    }
                    .alert("The final result is \(score)/8", isPresented: $showResultAlert) {
                        Button(action: reset) { Text("Reset") }
                    }
                    Text("Score: \(score)")
                        .foregroundStyle(.white)
                        .font(.title.bold())
                }
            }
        }
        
    }
    
    func reset() {
        remainingTries = 8
        score = 0
        correctAnswer = Int.random(in: 0...countries.count)
    }
    
    func checkAnswer(answer: String) {
        remainingTries -= 1
        answerIsCorrect = countries[correctAnswer] == answer
        
        if answerIsCorrect {
            score += 1
            answerAlertTitle = "Answer is correct"
            answerAlertMessage = nil
        } else {
            answerAlertTitle = "Answer is incorrect"
            answerAlertMessage = "This is the flag of \(answer)"
        }
        
        showAnswerAlert = true
        correctAnswer = Int.random(in: 0...countries.count)
        
        showResultAlert =  remainingTries == 0
    }
}

#Preview {
    GuessTheFlagView()
}

struct FlagImage: View {
    var country: String
    
   init(_ countryFlag: String) {
        country = countryFlag
    }
    
    var body: some View {
        Image(country)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .shadow(radius: 5)
    }
}
