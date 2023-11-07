//
//  BetterRestView.swift
//  PlaygroundApp
//
//  Created by Leonardo Kiszewski on 07/11/23.
//

import SwiftUI

struct BetterRestView: View {
    @State var wakeUp: Date = {
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let dateFromComponents = Calendar.current.date(from: components)
        return dateFromComponents!
    }()
    
    @State var sleepHours = 8.0

    var body: some View {
        DatePicker(selection: $wakeUp, displayedComponents: [.hourAndMinute]) {
            Text("Wake Up")
        }
        .labelsHidden()
        Text(wakeUp.formatted())
    }
}

#Preview {
    BetterRestView()
}
