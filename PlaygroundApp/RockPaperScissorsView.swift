//
//  RockPaperScissorsView.swift
//  PlaygroundApp
//
//  Created by Leonardo Kiszewski on 05/11/23.
//

import SwiftUI

struct RockPaperScissorsView: View {
    @State var score = 0
    @State var lastResult: String?
    @State var correctAnswer: Element?
    
    let elements = Element.allCases
    
    var body: some View {
        ZStack {
            LinearGradient(stops: [
                Gradient.Stop(color: .blue, location: 0.01),
                Gradient.Stop(color: .gray, location: 0.6),
                Gradient.Stop(color: .black, location: 0.98),
            ], startPoint: .top, endPoint: .bottom)
            VStack(spacing: 16) {
                HStack {
                    VStack(alignment: .leading) {
                        ForEach(elements, id: \.self) { e in
                            Text(e.rawValue.uppercased())
                                .font(.subheadline)
                                .bold()
                                .foregroundStyle(.white)
                        }
                    }
                    Spacer()
                    VStack {
                        Text("Score")
                        Text(score.description)
                            .font(.largeTitle)
                            .bold()
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 24)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                }
                .padding()
                .border(.white)
                
                if lastResult != nil { Text(lastResult!) }
                
                if correctAnswer != nil {
                    Text("Machine chooses \(correctAnswer!.rawValue)")
                }
                
                ForEach(elements, id: \.self) { option in
                    Button(action: { check(option) }) {
                        Text(option.icon())
                            .font(.largeTitle)
                            .padding(38)
                            .background(.white)
                            .clipShape(Circle())
                            .padding(12)
                            .background(option.color())
                            .opacity(0.8)
                            .clipShape(Circle())
                    }
                }
            }
            .padding(32)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        }
        .ignoresSafeArea()
    }
    
    func check(_ option: Element) {
        correctAnswer = elements.randomElement()!
        
        let comparison = compareOptions(option, correctAnswer!)
        
        if comparison == nil {
            lastResult = draw
            return
        }
        
        if comparison! {
            lastResult = win
            score += 1
        } else {
            lastResult = lose
        }
    }
    
    func compareOptions(_ v1: Element, _ v2: Element) -> Bool? {
        if v1 == v2 {
            return nil
        }
        
        if v1 == .rock {
            return v2 == .scissors
        }
        
        if v1 == .paper {
            return v2 == .rock
        }
        
        if v1 == .scissors {
            return v2 == .paper
        }
        
        return nil
    }
    
    let draw = "Draw"
    let win = "Win"
    let lose = "Lose"
}

#Preview {
    RockPaperScissorsView()
}

enum Element: String, CaseIterable {
    case  rock, paper, scissors
}

extension Element {
    func icon() -> String {
        return switch(self) {
        case .rock:
            "✊🏻"
        case .paper:
            "🖐🏻"
        case .scissors:
            "✌🏻"
        }
    }
    
    func color() -> Color {
        return switch(self) {
        case .rock:
                .red
        case .paper:
                .blue
        case .scissors:
                .green
        }
    }
}
