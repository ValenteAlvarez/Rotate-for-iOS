//
//  DashboardViewModel.swift
//  RotateApp
//
//  Created by Valente Alvarez on 19/12/24.
//

import Foundation

struct Response: Decodable {
	let results: [Result]
}

struct Result: Decodable {
	let trackId: Int
	let trackName: String
	let collectionName: String
}

extension DashboardView {
	@Observable
	class ViewModel {
		var currentUser: User? = AuthManager.shared.currentUser
		
		func logout(navigate: @escaping () -> Void) {
			AuthManager.shared.logout() {
				navigate()
			}
		}
		
		func printCurrentUser() {
			print(AuthManager.shared.currentUser ?? "No user logged in")
		}
	}
}
