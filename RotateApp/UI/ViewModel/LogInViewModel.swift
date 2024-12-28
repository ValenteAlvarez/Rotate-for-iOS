//
//  LogInViewModel.swift
//  RotateApp
//
//  Created by Valente Alvarez on 04/12/24.
//

import Foundation
import FirebaseAuth


extension LogInView {
	@Observable
	class ViewModel {
		var emailText: String = ""
		var passwordText: String = ""
		
		func logIn(email: String, password: String, navigate: @escaping () -> Void) {
			FirebaseAuthManager.shared.login(email: email, password: password) {
				navigate()
			}
		}
		
		func logout() {
			
		}
		
	}
}
