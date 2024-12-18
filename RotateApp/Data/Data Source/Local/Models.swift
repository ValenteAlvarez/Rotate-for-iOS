//
//  Models.swift
//  RotateApp
//
//  Created by Valente Alvarez on 04/12/24.
//

import Foundation
import SwiftData

@Model
class UserModel {
	var id: String
	var name: String
	var email: String
	var isOnLeave: Bool = false
	
	init(id: String, name: String, email: String, isOnLeave: Bool) {
		self.id = id
		self.name = name
		self.email = email
		self.isOnLeave = isOnLeave
	}
		// XRef Tables
		// UsersAndGroups ()
		// UsersAndTasks ()
}

@Model
class GroupModel {
	var id: String
	var name: String
	
	init(id: String, name: String) {
		self.id = id
		self.name = name
	}
}

@Model
class TaskModel {
	var id: String
	var name: String
	var taskDescription: String
	var groupId: String
	var isRotating: Bool
	var rotationTime: RotationTimes
	var difficulty: TaskDifficulty
	
	init(id: String, name: String, description: String, groupId: String, isRotating: Bool, rotationTime: RotationTimes, difficulty: TaskDifficulty) {
		self.id = id
		self.name = name
		self.taskDescription = description
		self.groupId = groupId
		self.isRotating = isRotating
		self.rotationTime = rotationTime
		self.difficulty = difficulty
	}
}

// CROSS REFERENCE TABLES:
class UsersGroupsXRef {
	var userId: String
	var groupId: String
	
	init(userId: String, groupId: String) {
		self.userId = userId
		self.groupId = groupId
	}
}


class UsersTasksXRef {
	var userId: String
	var taskId: String
	
	init(userId: String, taskId: String) {
		self.userId = userId
		self.taskId = taskId
	}
}
