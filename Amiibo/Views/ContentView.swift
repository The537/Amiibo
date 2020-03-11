//
//  ContentView.swift
//  Amiibo
//
//  Created by Les Lariz on 2/21/20.
//  Copyright © 2020 Les R Lariz. All rights reserved.
//
import SwiftUI


struct ContentView:  View {
	
	
	@ObservedObject var networkingManager = NetworkingManager()
	@ObservedObject var urlImageModel: URlImageModel
	
	init(urlString: String?) {
		urlImageModel = URlImageModel(urlString: urlString)
		
	}
	
	var body: some View {
		
		NavigationView() {
			
			VStack  {
				
				Divider()
				Text("Choose Amiibo Type")
					.fontWeight(.heavy)
				Divider()
				Picker(selection: $networkingManager.selectedAmiibo, label:Text( "Amiibo Type")) {
					ForEach(AmiiboType.allCases) { amiiboType in Text(amiiboType.name).tag(amiiboType)
					}
				}.onReceive([self.networkingManager.selectedAmiibo].publisher.first()) { (value) in print(value) }
	
				Divider()
				Text("Picker: = \(networkingManager.selectedAmiibo.name)")
					.fontWeight(.heavy)
				Text("Number of Amiibo: = \(networkingManager.amiiboList.amiibo.count)")
					.fontWeight(.heavy)
				Divider()
				
				VStack {
					List(networkingManager.amiiboList.amiibo, id: \.tail ) { char in
						
						VStack {
							
							UrlImageView(urlString: char.image)
							
							Divider()
							HStack(alignment: .center) {
								VStack(alignment: .trailing) {
									Text("Amiibo Series:")
										.font(.footnote)
										.fontWeight(.heavy)
									Text("Game Series:")
										.font(.footnote)
										.fontWeight(.heavy)
									Text("Character:")
										.font(.footnote)
										.fontWeight(.heavy)
									Text("Type:")
										.font(.footnote)
										.fontWeight(.heavy)
									
								}
								
								VStack(alignment: .leading) {
									Text (char.amiiboSeries)
										.font(.footnote)
										.fontWeight(.heavy)
									Text(char.gameSeries)
										.font(.footnote)
										.fontWeight(.heavy)
									Text(char.name)
										.font(.footnote)
										.fontWeight(.heavy)
									Text(char.type)
										.font(.footnote)
										.fontWeight(.heavy)
								}
							}
						}
					}
				}
			}.navigationBarTitle("Amiibo Database",displayMode:  .inline )
		}.pickerStyle(SegmentedPickerStyle())
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView(urlString: nil)
	}
	
}
