//
//  Destination.swift
//  Planner
//
//  Created by Tom Work on 13/02/2024.
//

import Foundation
import SwiftData

@Model
class Destination: Identifiable, Hashable {
    enum CodingKeys: CodingKey {
        case id, name, slug, parks
    }
    
    var id: String
    var name: String
    var slug: String
    var parks: [Park]
    
    init(id: String, name: String, slug: String, parks: [Park] = []) {
        self.id = id
        self.name = name
        self.slug = slug
        self.parks = parks
    }
    
}
