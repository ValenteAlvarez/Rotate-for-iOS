//
//  SignUpViewModel.swift
//  RotateApp
//
//  Created by Valente Alvarez on 18/12/24.
//

import Foundation
import FirebaseAuth

extension SignUpView {
	@Observable
	class ViewModel {
		
		var emailText: String = ""
		var nameText: String = ""
		var passwordText: String = ""
		var repeatPasswordText: String = ""
		
		func signUp(name: String, email: String, password: String, navigate: @escaping () -> Void) {
			AuthManager.shared.signUp(name: name, email: email.lowercased(), password: password, navigate: navigate)
		}
	}
}
