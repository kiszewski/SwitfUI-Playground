//
//  PlaygroundListView.swift
//  PlaygroundApp
//
//  Created by Leonardo Kiszewski on 16/01/24.
//

import SwiftUI

struct PlaygroundListView: View {
    @State private var showLengthConverter = false
    @State private var showGuessTheFlag = false
    @State private var showExamplesForm = false
    @State private var showGradients = false
    @State private var showCustomBinding = false
    @State private var showGame = false
    @State private var showBetterRest = false
    @State private var showUIKitPlaygroud = false
    @State private var showUserEnvironmentObject = false

    var body: some View {
        
        NavigationStack {
            VStack(spacing: 16) {
                Button("Length Converter")
                    { showLengthConverter = true }
                Button("Guess The Flag")
                    { showGuessTheFlag = true }
                Button("Examples Form")
                    { showExamplesForm = true }
                Button("Gradients")
                    { showGradients = true }
                Button("Custom Binding")
                    { showCustomBinding = true }
                Button("Rock, Paper and Scissors")
                    { showGame = true }
                Button("Better Rest")
                    { showBetterRest = true }
                Button("UIKit Playground")
                    { showUIKitPlaygroud = true }
                Button("User Environment Object")
                    { showUserEnvironmentObject = true }
            }
            .navigationDestination(isPresented: $showLengthConverter) { LengthConverterView()
            }
            .navigationDestination(isPresented: $showGuessTheFlag) {
                GuessTheFlagView()
            }
            .navigationDestination(isPresented: $showExamplesForm) {
                ExamplesForm()
            }
            .navigationDestination(isPresented: $showGradients) {
                GradientsAndAlertView()
            }
            .navigationDestination(isPresented: $showCustomBinding) {
                CustomBindingView()
            }
            .navigationDestination(isPresented: $showGame) {
                RockPaperScissorsView()
            }
            .navigationDestination(isPresented: $showBetterRest) {
                BetterRestView()
            }
            .navigationDestination(isPresented: $showUIKitPlaygroud) {
                UIKitPlaygroundView()
            }
            .navigationDestination(isPresented: $showUserEnvironmentObject) {
                EditUserView()
            }

        }
    }
}

func getView() -> some View {
    //TODO: Maybe create a enum to represet each View
    return Text("")
}

#Preview {
    PlaygroundListView()
}
