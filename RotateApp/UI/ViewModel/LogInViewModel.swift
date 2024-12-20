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
			Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
				guard let strongSelf = self else { return }
				
				if result != nil {
					navigate()
				}
				else {
					print(error?.localizedDescription ?? " Unknown error logging in")
				}
			}
		}
		
	}
}
