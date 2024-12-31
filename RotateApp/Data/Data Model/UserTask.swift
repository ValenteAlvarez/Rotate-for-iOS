//
//  Task.swift
//  RotateApp
//
//  Created by Valente Alvarez on 08/11/24.
//

import Foundation

enum TaskDifficulty: String, Codable {
	case EASY, MEDIUM, HARD
}

enum RotationTimes: String, Codable {
	case NONE, DAILY, WEEKLY, BIWEEKLY, MONTHLY, CUSTOM
}

struct UserTask: Codable {
	private(set) var id: UUID = UUID()
	var name: String
	var description: String = ""
	var isRotating: Bool = false
	var rotationTime: RotationTimes = RotationTimes.NONE
	var usersAssigned: [User] = []
	var difficulty: TaskDifficulty = TaskDifficulty.EASY
}

struct TaskEvent {
	let parentTask: UserTask
	let dueDate: Date
	let isCompleted: Bool = false
}
