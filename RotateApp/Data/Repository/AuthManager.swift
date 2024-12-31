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
class AuthManager: AuthService {
	static let shared = AuthManager()
	
	private init(currentUser: User? = nil) {
		self.currentUser = currentUser
	}
	
	private(set) var currentUser: User?
	
	func login(email: String, password: String, navigate: @escaping () -> Void) {
		Task {
			do {
				try await Auth.auth().signIn(withEmail: email, password: password)
				print("LogIn successful, fetchin User...")
				
				if let user = try await FirestoreManager.shared.fetchUser(email: email) {
					print("User fetched successfully: \(user)")
					self.currentUser = user
					navigate()
				}
				else {
					return
				}
			}
		}
	}
	
	func logout(navigate: @escaping () -> Void) {
		do {
			try Auth.auth().signOut()
			self.currentUser = nil
			navigate()
		}
		catch {
			print("Error on logout")
		}
	}
}
