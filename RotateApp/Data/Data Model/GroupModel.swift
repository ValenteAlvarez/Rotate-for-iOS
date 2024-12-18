//
//  Group.swift
//  RotateApp
//
//  Created by Valente Alvarez on 08/11/24.
//

import Foundation

struct Group {
	let id: String = UUID().uuidString
	var name: String
	var admins: [User] = []
	var tasks: [Task] = []
	var members: [User] = []
	var taskHistory: [Task] = []
	var pendingTasks: [Task] = []
	var completedTasks: [Task] = []
}
