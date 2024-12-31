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
	
	func fetchUser(email: String) async throws -> User? {
		print("fetching user \(email.lowercased())")
		let dir = db.collection("Users").document("val@tec.mx")
		
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
