//
//  Recipe.swift
//  Recipe Search
//
//  Created by Kelvin on 6/22/24.
//

import Foundation

struct Recipe: Decodable, Identifiable {
    var id: Int
    var title: String
    var image: String
}
