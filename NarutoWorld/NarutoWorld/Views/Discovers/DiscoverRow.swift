//
//  DiscoverItem.swift
//  NarutoWorld
//
//  Created by Jo Michael on 5/3/23.
//

import SwiftUI

struct DiscoverRow: View {
    private(set) var characterItem: CharacterItem
    
    var body: some View {
        VStack {
            NavigationLink {
                CharacterDetail(characterItem: characterItem)
            } label: {
                DiscoverItem(characterItem: characterItem)
            }
        }
    }
}

struct DiscoverItem_Previews: PreviewProvider {
    static var characterItems = ModelData().characters
    
    static var previews: some View {
        DiscoverRow(characterItem: characterItems[0])
    }
}
