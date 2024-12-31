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
	var groups: [Group]?
	var assignedTasks: [UserTask]?
}
