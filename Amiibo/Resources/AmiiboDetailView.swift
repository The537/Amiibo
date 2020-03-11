//
//  AmiiboDetailView.swift
//  Amiibo
//
//  Created by Les Lariz on 2/26/20.
//  Copyright © 2020 Les R Lariz. All rights reserved.
//

import SwiftUI

struct AmiiboDetailView: View {
	
	@ObservedObject var networkingManager = NetworkingManager()
	
	@ObservedObject var urlImageModel: URlImageModel
	
	init(urlString: String?) {
		urlImageModel = URlImageModel(urlString: urlString)
	}
	var body: some View {
		VStack {
			
			HStack  {
		
				Image(uiImage: urlImageModel.image ?? UrlImageView.defaultImage!)
					.resizable()
					.scaledToFit()
					.scaledToFit()
					.frame(width: 300, height: 300)
				
			}
			
					HStack {
						VStack(alignment: .trailing) {
							Text("Amiibo Series: =")
								.font(.headline)
								.fontWeight(.heavy)
							Text("Game Series: =")
								.font(.headline)
								.fontWeight(.heavy)
							Text("Character: =")
								.font(.headline)
								.fontWeight(.heavy)
								.multilineTextAlignment(.trailing)
							Text("Type: =")
								.font(.headline)
								.fontWeight(.heavy)
								
						}
									
						VStack(alignment: .leading) {
							Text("Amiibo Series ")
								.font(.headline)
								.fontWeight(.heavy)
							Text("Game Series  ")
								.font(.headline)
								.fontWeight(.heavy)
							Text("Character Name  ")
								.font(.headline)
								.fontWeight(.heavy)
							Text("Amiibo Type ")
								.font(.headline)
								.fontWeight(.heavy)
								
						}
					}
				}
			}
		}

struct AmiiboDetailView_Previews: PreviewProvider {
	static var previews: some View {
		AmiiboDetailView(urlString: nil )
	}
}
