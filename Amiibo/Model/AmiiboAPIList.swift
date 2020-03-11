//
//  AmiiboApiList.swift
//  Amiibo
//
//  Created by Les Lariz on 2/21/20.
//  Copyright © 2020 Les R Lariz. All rights reserved.
//

import Foundation
import Combine

	struct AmiiboAPIList: Codable   {
		
			var amiibo: [AmiiboListEntry]
		
	}
	class AmiiboListEntry:   Codable  {
		 
			var amiiboSeries: String
			var character: String
			var gameSeries: String
			var head: String
			var image: String
			var name: String
			var release: Dictionary<String,String?>
			var tail: String
			var type: String
		
	}

