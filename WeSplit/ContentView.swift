//
//  ContentView.swift
//  WeSplit
//
//  Created by Leonardo Kiszewski on 28/08/23.
//

import SwiftUI

struct ContentView: View {
    let tipPercentages = [10, 15, 20, 25, 0]
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 1
    @State private var tipPercentage = 0
    private var total: Double {
        let percent = Double(tipPercentage) / 100.0
                             
        let value = (checkAmount + (percent * checkAmount)) / Double(numberOfPeople)
        
        print(value)
        return value
    }
    
    var code = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        Form {
            TextField("Amount", value: $checkAmount, format: .currency(code: code))
                .keyboardType(.decimalPad)
            TextField("People", value: $numberOfPeople, format: .number)
                .keyboardType(.numberPad)
            Picker("Tip", selection: $tipPercentage) {
                ForEach(tipPercentages, id: \.self) { v in
                    Text(v.description)
                }
            }
            Text(total, format: .currency(code: code))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
