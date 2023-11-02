//
//  ContentView.swift
//  WeSplit
//
//  Created by Leonardo Kiszewski on 28/08/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 1
    @State private var tipPercentage = 0
    @FocusState private var textFieldIsFocused: Bool
    
    private var percent: Double { Double(tipPercentage) / 100.0 }
    
    private var amountPerPerson: Double {
        (checkAmount + (percent * checkAmount)) / Double(numberOfPeople)
    }
    
    private var totalAmount: Double {
        checkAmount + (percent * checkAmount)
    }
    
    var code = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Amount", value: $checkAmount, format: .currency(code: code))
                    .keyboardType(.decimalPad)
                    .focused($textFieldIsFocused)
                TextField("People", value: $numberOfPeople, format: .number)
                    .keyboardType(.numberPad)
                Picker("Tip percent", selection: $tipPercentage) {
                    ForEach(1..<101, id: \.self) { v in
                        Text("\(v.description)%")
                    }
                }
                .pickerStyle(.navigationLink)
                Section("Amount per person") {
                    Text(amountPerPerson, format: .currency(code: code))
                }
                Section("Total") {
                    Text(totalAmount, format: .currency(code: code))
                }
            }
            .navigationTitle("We Split")
            .toolbar {
                if textFieldIsFocused {
                    Button("Done") {
                        textFieldIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
