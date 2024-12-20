//
//  LoginView.swift
//  RotateApp
//
//  Created by Valente Alvarez on 08/11/24.
//

import SwiftUI

struct LogInView: View {
	@State var viewModel = ViewModel()
	@Binding var path: [NavRoutes]
	
	
    var body: some View {
		VStack {
			Text("Welcome Back!")
				.font(.title)
			FormTextField(label: "E-Mail", text: $viewModel.emailText)
			SecureFormTextField(label: "Password", text: $viewModel.passwordText)
				

			Button {
				viewModel.logIn(email: viewModel.emailText, password: viewModel.passwordText) {
					print("User has logged in!")
					path = [.dashboard]
				}
			} label: {
				Text("Log In")
					.padding(5)
			}
			.buttonBorderShape(.capsule)
			.buttonStyle(.bordered)
		
			
			Text("Don't have an account?")
				.font(.footnote)
				.padding(.top)
			Button {
				path = [.signup]
			}
			label: {
				Text("Make an account")
					.font(.footnote)
			}
		}
		.padding(10)
    }
}
