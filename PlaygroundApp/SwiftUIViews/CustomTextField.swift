//
//  CustomTextField.swift
//  PlaygroundApp
//
//  Created by Leonardo Kiszewski on 10/09/24.
//

import SwiftUI

struct CustomTextField: View {
    let title: String
    @Binding var text: String
    @Environment(\.clearable) var clearable
    
    var clearableBtn: some View {
        HStack {
            Spacer()
            if clearable {
                Button(action: {text = ""}) {
                    Image(systemName: "xmark.circle")
                }
            }
        }
    }
    
    var body: some View {
        TextField(title, text: $text)
            .padding(.trailing, clearable ? 25 : 0)
            .overlay { clearableBtn }
    }
}

struct CustomForm: View {
    @State var name = "Teste nome muito grande Teste nome muito grande Teste nome muito grande Teste nome muito grande"
    @State var mail = ""
    
    var body: some View {
        Section {
            Text("Teste de view modifier somente no input custom")
            CustomTextField(title: "Nome", text: $name)
            CustomTextField(title: "E-mail", text: $mail)
                .clearable()
        }.clearable(false)
    }
}

extension View {
    func clearable(_ makeClearable: Bool = true) -> some View {
        environment(\.clearable, makeClearable)
    }
}

#Preview {
    CustomForm()
}

private struct ClearableEnvironmentKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var clearable: Bool {
        get { self[ClearableEnvironmentKey.self] }
        set { self[ClearableEnvironmentKey.self] = newValue }
    }
}
