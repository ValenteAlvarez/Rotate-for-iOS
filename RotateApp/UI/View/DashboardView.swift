//
//  Dashboard.swift
//  RotateApp
//
//  Created by Valente Alvarez on 08/11/24.
//

import SwiftUI

struct DashboardView: View {
	let viewModel = ViewModel()
	
	@Binding var path: [NavRoutes]
	
	
	
    var body: some View {
		VStack {
			Text("Hello, Valente")
				.font(.largeTitle.bold())
				.frame(maxWidth: .infinity, alignment: .trailing)
				.padding(.trailing, 10)
			HStack {
				DashboardCard(
					color: .white,
					text: "Tasks",
					systemImageName: "checkmark.circle.fill"
				)
				VStack {
					DashboardCard(
						color: .green,
						textColor: .white,
						text: "Completed",
						systemImageName: "checkmark.circle.fill"
					)
					DashboardCard(
						color: .red,
						textColor: .white,
						text: "Late",
						systemImageName: "checkmark.circle.fill"
					)
				}
			}
			.frame(maxWidth: .infinity, maxHeight: 250)
			.navigationBarBackButtonHidden(true)
			
			List(viewModel.results, id: \.trackId) { item in
				VStack(alignment: .leading) {
					Text(item.trackName)
						.font(.headline)
					Text(item.collectionName)
						.font(.subheadline)
				}
			}
			.task {
				await viewModel.loadData()
			}
		}
    }
}

struct DashboardCard: View {
	var color: Color = Color.white
	var textColor: Color = .black
	var text: String = ""
	var systemImageName: String = ""
	var count: Int = 0
	
	var body: some View {
		VStack {
			Label(text, systemImage: systemImageName)
				.foregroundStyle(textColor)
				.padding(0)
				.font(.title3)
				.fontWeight(.bold)
				.frame(maxWidth: .infinity, alignment: .leading)
			Text(String(count))
				.foregroundStyle(textColor)
				.padding(0)
				.font(.system(size: 50))
				.fontWeight(.bold)
				.frame(maxWidth: .infinity, alignment: .leading)
		}
		.padding()
		.frame(maxHeight: .infinity)
		.background(color)
		.clipShape(.rect(cornerRadius: 10))
		.shadow(radius: 5)
		
	}
}


//
//#Preview {
//	DashboardView()
//}
