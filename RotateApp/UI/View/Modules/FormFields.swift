//
//  FormFields.swift
//  RotateApp
//
//  Created by Valente Alvarez on 08/11/24.
//

import SwiftUI


struct FormTextField: View {
	var label: String
	@Binding var text: String
	
	var body: some View {
		TextField(label, text: $text)
			.textInputAutocapitalization(.never)
			.padding()
			.overlay {
				Rectangle().foregroundStyle(Color.gray).frame(height: 1).offset(y: 20)
			}
	}
}

struct SecureFormTextField: View {
	var label: String
	@Binding var text: String
	@State var isHidden: Bool = true
	
	var body: some View {
		ZStack(alignment: .trailing) {
			Group {
				if isHidden {
					SecureField(label, text: $text)
						.frame(height: 52)
						
				}
				else {
					TextField(label , text: $text)
						.frame(height: 52)
				}
			}
			
			Button(
				action: { isHidden.toggle() },
				label: {
					Image(systemName: isHidden ? "eye" : "eye.slash")
						.padding()
						.foregroundColor(.gray)
				})
		}
		.padding()
		.overlay {
			Rectangle().foregroundStyle(Color.gray).frame(height: 1).offset(y: 20)
		}
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

