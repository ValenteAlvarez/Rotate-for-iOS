//
//  RotateAppApp.swift
//  RotateApp
//
//  Created by Valente Alvarez on 08/11/24.
//

import SwiftUI
import SwiftData
import FirebaseCore
import FirebaseFirestore

@main
struct RotateAppApp: App {
	init() {
		FirebaseApp.configure()
	}
	
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
		.modelContainer(for: UserModel.self)
    }
}
