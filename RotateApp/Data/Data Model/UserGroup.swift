//
//  Group.swift
//  RotateApp
//
//  Created by Valente Alvarez on 08/11/24.
//

import Foundation

struct UserGroup: Codable {
	private(set) var id: String = UUID().uuidString
	var name: String
	var admins: [User] = []
	var tasks: [UserTask] = []
	var members: [User] = []
	var taskHistory: [UserTask] = []
	var pendingTasks: [UserTask] = []
	var completedTasks: [UserTask] = []
}
