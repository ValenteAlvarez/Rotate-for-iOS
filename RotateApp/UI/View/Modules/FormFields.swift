//
//  FormFields.swift
//  RotateApp
//
//  Created by Valente Alvarez on 08/11/24.
//

import SwiftUI


struct FormTextField: View {
	var label: String
	var text: Binding<String>
	
	var body: some View {
		TextField(label, text: text)
			.padding(10)
			.border(Color.gray, width: 1)
	}
}

struct SecureFormTextField: View {
	var label: String
	var text: Binding<String>
	
	var body: some View {
		SecureField(label, text: text)
			.padding(10)
			.border(Color.gray, width: 1)
	}
}

struct CapsuleButton: View {
	var text: String
	var onClick: () -> Void
	
	var body: some View {
		Button( action: { onClick() }) {
			Text(text)
				.padding(5)
		}
		.buttonBorderShape(.capsule)
		.buttonStyle(.bordered)
	}
}

