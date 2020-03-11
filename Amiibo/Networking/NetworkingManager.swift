//
//  NetworkingManager.swift
//  Amiibo
//
//  Created by Les Lariz on 2/21/20.
//  Copyright © 2020 Les R Lariz. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

enum AmiiboType: Int, CaseIterable, Hashable, Identifiable {

	case figure
	case card
	case yarn
}
extension AmiiboType {
	
	var name: String {
		
        return "\(self)".map {
            $0.isUppercase ? " \($0)" : "\($0)" }.joined().capitalized
		}
		var id: AmiiboType {self}
	}



class NetworkingManager : ObservableObject   {
	
	@Published var willChange = PassthroughSubject<NetworkingManager, Never>()
	
	@Published var  amiiboList = AmiiboAPIList( amiibo:[]) 
	
	@Published var selectedAmiibo  = AmiiboType.figure
	
	
	
	init() {
		
		guard let url = URL(string: "https://www.amiiboapi.com/api/amiibo/?type="+"\(selectedAmiibo)") else {  return }
		
		print("Selected: \(selectedAmiibo)")
		
		URLSession.shared.dataTask(with: url) { (data, _, _) in
			guard let data = data else   { return }
			
			let amiiboList = try! JSONDecoder().decode(AmiiboAPIList.self, from: data)
			
			DispatchQueue.main.asyncAfter(deadline: .now()) {
				self.amiiboList = amiiboList
				
			}
		} .resume()
	}
}