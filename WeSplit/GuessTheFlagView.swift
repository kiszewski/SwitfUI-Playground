//
//  GuessTheFlagView.swift
//  WeSplit
//
//  Created by Leonardo Kiszewski on 26/10/23.
//

import SwiftUI

struct GuessTheFlagView: View {
    var body: some View {
        ZStack {
            VStack {
                Color.red
                Color.yellow
                Color.secondary
                    .frame(width: 100, height: 50)
                    
            }            
            Text("Content")
                .foregroundStyle(.blue)
                .padding(50)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 32))
        }
        .ignoresSafeArea()
    }
}

#Preview {
    GuessTheFlagView()
}
