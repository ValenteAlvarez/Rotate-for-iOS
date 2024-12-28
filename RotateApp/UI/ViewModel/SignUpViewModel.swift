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
		
		func signUp(email: String, password: String, navigate: @escaping () -> Void) {
			Auth.auth().createUser(withEmail: email, password: password) { result, error in
				if let error {
					return print(error)
				}
				
				else {
					
					navigate()
					print(result ?? "null result, but a result.")
				}
			}
		}
	}
}
