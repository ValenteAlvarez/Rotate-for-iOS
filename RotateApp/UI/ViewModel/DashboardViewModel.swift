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
		
	}
}
