//
//  AmiiboApiList.swift
//  Amiibo
//
//  Created by Les Lariz on 2/21/20.
//  Copyright © 2020 Les R Lariz. All rights reserved.
//

import Foundation
import Combine
	struct AmiiboListEntry:   Codable  {
	 
		var amiiboSeries: String
		var character: String
		var gameSeries: String
		var head: String
		var image: String
		var name: String
		var release: Release
		var tail: String
		var type: String
		
		struct  Release: Codable {
			
			var au: String?
			var eu: String?
			var jp: String?
			var na: String?
		
			
		}
		
	
}
	struct AmiiboAPIList: Codable   {
		
		var amiibo: [AmiiboListEntry]
		
	}
	
extension AmiiboListEntry {
    
    private var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }
    
}

// MARK: extension Date
extension Date {
    
    func toString(dateFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
