//
//  ContentView.swift
//  Recipe Search
//
//  Created by Kelvin on 6/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var recipes = [Recipe]()
    @State private var searchTerm = ""
    
    var body: some View {
        VStack {
            HStack{
                TextField("Search for recipes", text: $searchTerm)
                    .textFieldStyle(.roundedBorder)
                Button("Search") {
                    searchForRecipes()
                }
            }
            List(recipes) { recipe in
                HStack(spacing: 10) {
                    AsyncImage(url: URL(string: recipe.image)) { image in
                        image
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    } placeholder: {
                        ProgressView()
                    }
                    Text(recipe.title)
                }
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
        }
        .padding()
    }
    
    func searchForRecipes() {
        Task {
            self.recipes = await DataService().getRecipes(term: searchTerm)
        }
    }
}

#Preview {
    ContentView()
}
