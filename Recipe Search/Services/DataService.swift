//
//  DataService.swift
//  Recipe Search
//
//  Created by Kelvin on 6/22/24.
//

import Foundation

struct DataService {
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getRecipes(term: String) async -> [Recipe] {
        guard apiKey != nil else {
            return [Recipe]()
        }
        
        let urlString = "https://api.spoonacular.com/recipes/complexSearch?query=\(term)"
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.addValue(apiKey!, forHTTPHeaderField: "x-api-key")
            
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                let decoder = JSONDecoder()
                let recipeData = try decoder.decode(RecipeResponse.self, from: data)
                return recipeData.results
            } catch {
                print(error.localizedDescription)
            }
        }
        return [Recipe]()
    }
}
