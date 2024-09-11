//
//  EditUserView.swift
//  PlaygroundApp
//
//  Created by Leonardo Kiszewski on 11/09/24.
//

import SwiftUI

struct EditUserView: View {
    @EnvironmentObject var viewModel: UserViewModel
    
    var body: some View {
        NavigationLink {
            EditEmailUserView()
        } label: {
            VStack {
                Text("Nome: \(viewModel.user.name)")
                Text("Email: \(viewModel.user.email)")
            }
        }
    }
}

struct EditEmailUserView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: UserViewModel
    @State var email = ""

    var body: some View {
        VStack(spacing: 16) {
            CustomTextField(title: "E-mail", text: $email)
            Button {
                viewModel.user.email = email
                dismiss()
            } label: {
                Text("Done")
            }
        }
        .onAppear {
            email = viewModel.user.email
        }
        .padding(16)
    }
}

#Preview {
    EditUserView()
}
