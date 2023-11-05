//
//  CustomBindingView.swift
//  PlaygroundApp
//
//  Created by Leonardo Kiszewski on 05/11/23.
//

import SwiftUI

struct CustomBindingView: View {
    @State var agreePolicy = false
    @State var agreeTerms = false
    @State var receiveMails = false
    
    var body: some View {
        let agreeEverthing = Binding(
            get: {agreeTerms && agreePolicy && receiveMails},
            set: {
                agreePolicy = $0
                agreeTerms = $0
                receiveMails = $0
            })
        
        VStack {
            Toggle("Agree Privacy policy", isOn: $agreePolicy)
            Toggle("Agree Terms of use", isOn: $agreeTerms)
            Toggle("Receive mails", isOn: $receiveMails)
            Toggle("Mark all", isOn: agreeEverthing)
        }
        .padding()
    }
}

#Preview {
    CustomBindingView()
}
