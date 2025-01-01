//
//  FirestoreManager.swift
//  RotateApp
//
//  Created by Valente Alvarez on 29/12/24.
//

import Foundation
import FirebaseFirestore

class FirestoreManager {
	static let shared = FirestoreManager()
	
	let db = Firestore.firestore()
	
	func createUser(newUser: User) async throws -> Void {
		Task {
			do {
				try db.collection("Users").document(newUser.email).setData(from: newUser)
			}
			catch let error {
				print("Error writing to Firestore \(error)")
			}
		}
	}
	
	func fetchUser(email: String) async throws -> User? {
		print("fetching user \(email.lowercased())")
		let dir = db.collection("Users").document(email.lowercased())
		
		do {
			let user = try await dir.getDocument(as: User.self)
			return user
		}
		catch {
			print("error fetching user \(error)")
			return nil
		}
	}
}
