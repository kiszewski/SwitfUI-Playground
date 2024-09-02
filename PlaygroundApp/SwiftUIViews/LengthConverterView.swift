//
//  LengthConverterView.swift
//  WeSplit
//
//  Created by Leonardo Kiszewski on 25/10/23.
//

import SwiftUI

struct LengthConverterView: View {
    @State private var inputValue = 0.0
    @State private var inputType = LengthType.meter
    @State private var outputType = LengthType.feet
    
    private var output: Double {
        let inputInMeters: Double = switch(inputType) {
        case .meter:
            inputValue
        case .kilometer:
            inputValue * 1000
        case .feet:
            inputValue * 0.3048
        case .yards:
            inputValue * 0.9144
        case .miles:
            inputValue * 1609.344
        }
        
        
        switch(outputType) {
        case .meter:
            return inputInMeters
        case .kilometer:
            return inputInMeters / 1000
        case .feet:
            return inputInMeters * 3.2808399
        case .yards:
            return inputInMeters * 1.0936133
        case .miles:
            return inputInMeters * 0.00062137119
        }
    }
    
    var body: some View {
        Form {
            TextField("Value", value: $inputValue, format: .number)
                .keyboardType(.decimalPad)
            Section("Input Type") {
                Picker("", selection: $inputType) {
                    ForEach(LengthType.allCases, id: \.self) { v in
                        Text(v.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            Section("Output Type") {
                Picker("", selection: $outputType) {
                    ForEach(LengthType.allCases, id: \.self) { v in
                        Text(v.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            Section("Output") {
                Text(output.formatted())
            }
        }
    }
}

#Preview {
    LengthConverterView()
}

enum LengthType: String, CaseIterable  {
    case meter, kilometer, feet, yards, miles
}
