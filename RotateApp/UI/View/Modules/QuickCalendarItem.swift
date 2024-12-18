//
//  QuickCalendarItem.swift
//  RotateApp
//
//  Created by Valente Alvarez on 10/11/24.
//

import SwiftUI

struct QuickCalendarItem: View {
	var text: String = ""
	var assignedUsers: [User] = []
	
	var body: some View {
		HStack {
			Text("- \(text)")
			
			LazyVStack {
				ForEach(assignedUsers) { user in
					Image(systemName: "person.crop.circle")
						.foregroundStyle(
							Color(
								red: .random(in: 0...1),
								green: .random(in: 0...1),
								blue: .random(in: 0...1)))
				}
			}
			
		}
    }
}
