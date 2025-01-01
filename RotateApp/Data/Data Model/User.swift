//
//  User.swift
//  RotateApp
//
//  Created by Valente Alvarez on 08/11/24.
//

import Foundation

struct User: Identifiable, Codable {
	private(set) var id: String = UUID().uuidString
	let name: String
	let email: String
	var isOnLeave: Bool = false
	var groups: [UserGroup]?
	var assignedTasks: [UserTask]?
	
	enum CodingKeys: String, CodingKey {
		case name
		case email
		case isOnLeave
		case groups
		case assignedTasks
	}
}
