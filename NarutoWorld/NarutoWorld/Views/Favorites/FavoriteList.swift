//
//  Favorite.swift
//  NarutoWorld
//
//  Created by Jo Michael on 4/28/23.
//

import SwiftUI

struct FavoriteList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredCharactersItem: [CharacterItem] {
        return modelData.characters.filter { $0.isFavorite == true}
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredCharactersItem) { characterItem in
                    NavigationLink {
                        CharacterDetail(characterItem: characterItem)
                    } label: {
                        FavoriteItemRow(characterItem: characterItem)
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

struct Favorite_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteList()
            .environmentObject(ModelData())
    }
}
