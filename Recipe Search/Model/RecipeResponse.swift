//
//  RecipeResponse.swift
//  Recipe Search
//
//  Created by Kelvin on 6/22/24.
//

import Foundation

struct RecipeResponse: Decodable {
    var results: [Recipe]
}
