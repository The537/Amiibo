//
//  ContentView.swift
//  Amiibo
//
//  Created by Les Lariz on 2/21/20.
//  Copyright © 2020 Les R Lariz. All rights reserved.
//
//  Project Under Source Control
import Foundation
import SwiftUI
import UIKit

struct ContentView:  View {
	
	
	@ObservedObject var networkingManager: NetworkingManager = NetworkingManager()
	@ObservedObject var urlImageModel: URlImageModel
	@ObservedObject var amiibos = ReleaseDateModel(amiibo: amiibo1)
	
	init(urlString: String? ,amiibos: ReleaseDateModel) {
		urlImageModel = URlImageModel(urlString: urlString)
		self.amiibos = amiibos
		self.urlImageModel = URlImageModel(urlString: urlString)
		UISegmentedControl.appearance().selectedSegmentTintColor = .systemGreen
		UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
		UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.systemGreen], for: .normal)
		
	}
	
	var body: some View {
		
		NavigationView {
			
			VStack  {
				Divider()
				Text("Choose Amiibo Type")
					.fontWeight(.heavy)
				Divider()
				Picker(selection: $networkingManager.selectedAmiibo, label:Text( "Amiibo Type")) {
					ForEach(AmiiboType.allCases) { amiiboType in Text(amiiboType.name).tag(amiiboType)
					}
				}.pickerStyle(SegmentedPickerStyle())
				
				Divider()
				Text("Number of Amiibo: = \(networkingManager.amiiboList.amiibo.count)")
					.fontWeight(.heavy)
				Divider()
				
				VStack {
					
					List(networkingManager.amiiboList.amiibo, id: \.tail ) { amiibos in
						NavigationLink(destination: AmiiboDetailView(urlString: amiibos.image, amiibos: ReleaseDateModel(amiibo: amiibos))) {							
							HStack {
								
								UrlImageView(urlString: amiibos.image)
								HStack(alignment: .center) {
									VStack(alignment: .trailing) {
										Text("Amiibo Series:")
											.font(.custom( "Arial", size: 12))
											.fontWeight(.heavy)
										Text("Game Series:")
											.font(.custom( "Arial", size: 12))
											.fontWeight(.heavy)
										Text("Character:")
											.font(.custom( "Arial", size: 12))
											.fontWeight(.heavy)
										Text("Type:")
											.font(.custom( "Arial", size: 12))
											.fontWeight(.heavy)
										
									}
									
									VStack(alignment: .leading) {
										Text (amiibos.amiiboSeries)
											.font(.custom( "Arial", size: 12))
											.fontWeight(.heavy)
										Text(amiibos.gameSeries)
											.font(.custom( "Arial", size: 12))
											.fontWeight(.heavy)
										Text(amiibos.character)
											.font(.custom( "Arial", size: 12))
											.fontWeight(.heavy)
										Text(amiibos.type)
											.font(.custom( "Arial", size: 12))
											.fontWeight(.heavy)
	
									}
								}
							}
						}
					}.navigationBarTitle("Amiibo Database",displayMode:  .inline )
					.navigationBarItems(leading: Button(action: {self.networkingManager.loadData()}) { Image(systemName: "icloud.and.arrow.down.fill") })
					
				}
			}.navigationBarColor(.systemGreen)
		}.onAppear( perform: networkingManager.loadData)
			
	}
	struct ContentView_Previews: PreviewProvider {
		static var previews: some View {
			Group {
				ContentView(urlString: nil ,amiibos: ReleaseDateModel(amiibo: amiibo1))
				
			}
		}
	}
}
struct NavigationBarModifier: ViewModifier {
	
	var backgroundColor: UIColor?
	
	init( backgroundColor: UIColor?) {
		self.backgroundColor = backgroundColor
		let coloredAppearance = UINavigationBarAppearance()
		coloredAppearance.configureWithTransparentBackground()
		coloredAppearance.backgroundColor = .clear
		coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
		coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
		
		UINavigationBar.appearance().standardAppearance = coloredAppearance
		UINavigationBar.appearance().compactAppearance = coloredAppearance
		UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
		UINavigationBar.appearance().tintColor = .white
		
	}
	
	func body(content: Content) -> some View {
		ZStack{
			content
			VStack {
				GeometryReader { geometry in
					Color(self.backgroundColor ?? .clear)
						.frame(height: geometry.safeAreaInsets.top)
						.edgesIgnoringSafeArea(.top)
					Spacer()
				}
			}
		}
	}
}
extension View {
	
	func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
		self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
	}
	
}
