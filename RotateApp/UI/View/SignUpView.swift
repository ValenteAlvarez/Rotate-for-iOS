//
//  LoginView.swift
//  RotateApp
//
//  Created by Valente Alvarez on 08/11/24.
//

import SwiftUI

struct SignUpView: View {
	@State var viewModel = ViewModel()
	
	@Binding var path: [NavRoutes]
	
	
    var body: some View {
		VStack {
			Text("Welcome.")
				.font(.title)
			FormTextField(label: "Display Name", text: $viewModel.nameText)
				.textInputAutocapitalization(.none)
				.keyboardType(.emailAddress)
			FormTextField(label: "Email", text: $viewModel.emailText)
			SecureFormTextField(label: "Password", text: $viewModel.passwordText)
			SecureFormTextField(label: "Repeat Password", text: $viewModel.repeatPasswordText)
			
			CapsuleButton(text: "Sign Up", onClick: {
				viewModel.signUp(name: viewModel.nameText, email: viewModel.emailText, password: viewModel.passwordText) {
					path = [.dashboard]
				}
			})
			
			Text("Already have an account?")
				.font(.footnote)
				.padding(.top)
			
			Button {
				path = [.login]
			} label: {
				Text("Log In")
			}
		}
		.padding(10)
    }
}

#Preview {
	@Previewable @State var path: [NavRoutes] = []
	return SignUpView(path: $path)
}
