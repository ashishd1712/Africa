//
//  VideoModel.swift
//  Africa
//
//  Created by Ashish Dutt on 01/09/22.
//

import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
