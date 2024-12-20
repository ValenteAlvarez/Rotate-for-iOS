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
		var results = [Result]()
		
		func loadData() async {
			guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song")
			else {
				print("Invalid URL")
				return
			}
			
			do {
				let (data, _) = try await URLSession.shared.data(from: url)
				
				if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
					results = decodedResponse.results
				}
					
			} catch {
				print("Error: \(error)")
			}
		}
		
	}
}
