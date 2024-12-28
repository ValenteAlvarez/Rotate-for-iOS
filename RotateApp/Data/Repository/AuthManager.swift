//
//  AuthManager.swift
//  RotateApp
//
//  Created by Valente Alvarez on 25/12/24.
//

import Foundation
import FirebaseAuth

protocol AuthService {
	func login(email: String, password: String, navigate: @escaping () -> Void)
	func logout(navigate: @escaping () -> Void)
}

@Observable
class FirebaseAuthManager: AuthService {
	static let shared = FirebaseAuthManager()
	
	private init(currentUser: User? = nil) {
		self.currentUser = currentUser
	}
	
	private(set) var currentUser: User?
	
	func login(email: String, password: String, navigate: @escaping () -> Void) {
		Auth.auth().signIn(withEmail: email, password: password) { result, error in
			if let error {
				print("Error in login \(error.localizedDescription)")
			}
			else {
				print("Login successful \(result?.debugDescription ?? "...")")
				self.currentUser = User(name: "Tester", email: "test@tex.mx")
				navigate()
			}
		}
	}
	
	func logout(navigate: @escaping () -> Void) {
		do {
			try Auth.auth().signOut()
			navigate()
		}
		catch {
			print("Error on logout")
		}
	}
}
