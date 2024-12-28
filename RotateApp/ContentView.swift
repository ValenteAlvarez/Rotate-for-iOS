//
//  ContentView.swift
//  RotateApp
//
//  Created by Valente Alvarez on 08/11/24.
//

import SwiftUI
import SwiftData

enum NavRoutes: Hashable {
	case dashboard
	case login
	case signup
}

@Observable
class AppState {
	var isLoggedIn: Bool = false
	var currentUser: UserModel?
}

struct ContentView: View {
	@State var path = [NavRoutes]()
	
    var body: some View {
		NavigationStack(path: $path) {
			LogInView(path: $path)
			.navigationDestination(for: NavRoutes.self) { destination in
				switch destination {
					case .dashboard: DashboardView(path: $path)
					case .login: LogInView(path: $path)
					case .signup: SignUpView(path: $path)
				}
			}
			.modelContainer(for: [UserModel.self])
		}
    }
}

#Preview {
    ContentView()
}
