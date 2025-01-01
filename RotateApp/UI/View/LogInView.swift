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
	
	private var validForm: Bool {
		viewModel.emailText.count > 0 && viewModel.passwordText.count > 0
	}
	
	
    var body: some View {
		VStack {
			Text("Welcome Back!")
				.font(.title)
			FormTextField(label: "E-Mail", text: $viewModel.emailText)
			SecureFormTextField(label: "Password", text: $viewModel.passwordText)
				

			Button {
				viewModel.logIn(email: viewModel.emailText, password: viewModel.passwordText) {
					withAnimation {
						path = [.dashboard]
					}
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

#Preview {
	struct LogInPreview: View {
		@State var path: [NavRoutes] = [.dashboard]
		
		var body: some View {
			LogInView(path: $path)
		}
		
	}
	
	return LogInPreview()
}
