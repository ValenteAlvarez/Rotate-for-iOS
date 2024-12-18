//
//  User.swift
//  RotateApp
//
//  Created by Valente Alvarez on 08/11/24.
//

import Foundation

struct User: Identifiable {
	let id: String = UUID().uuidString
	let name: String
	let email: String
	let isOnLeave: Bool = false
	let groups: [Group]
	let assignedTasks: [Task]
}
