//
//  ReleaseSchedule.swift
//  Amiibo
//
//  Created by Mike Liao on 2019/11/3.
//  Copyright © 2019 Mike Liao. All rights reserved.
//

import SwiftUI

struct ReleaseSchedule: View {
    let country: String
    let release: Date?
    
    var releaseDate: String {
        release?.toString(dateFormat: "MMM-dd, yyyy") ?? "N/A"
    }
    
    var body: some View {
        VStack {
            Image(country)
                .resizable()
                .scaledToFit()
                .frame(height: 45)
            
            Text(releaseDate)
        }
    }
}

struct ReleaseSchedule_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            ReleaseSchedule(country: "jp", release: Date())
                .previewLayout(.sizeThatFits)
            ReleaseSchedule(country: "us", release: Date())
                .previewLayout(.sizeThatFits)
        }
        
    }
}
