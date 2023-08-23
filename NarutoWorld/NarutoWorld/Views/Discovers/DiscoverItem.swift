//
//  DiscoverCharacterItem.swift
//  NarutoWorld
//
//  Created by Jo Michael on 5/4/23.
//

import SwiftUI

struct DiscoverItem: View {
    var characterItem: CharacterItem
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: characterItem.image[0])) { image in
                image.resizable()
                    .frame(width: 88, height: 88)
                    .clipped()
                
            } placeholder: {
                ProgressView()
                    .frame(width: 88, height: 88)
            }
            .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(characterItem.name)
                    .font(.headline)
                
                Text(characterItem.description[0])
                    .font(.subheadline)
                    .lineLimit(2)
            }
            
            Spacer()
            
            if characterItem.isFavorite {
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundColor(.red)
            }
        }
    }
}

struct DiscoverCharacterItem_Previews: PreviewProvider {
    static var characterItems = ModelData().characters
    
    static var previews: some View {
        DiscoverItem(characterItem: characterItems[0])
    }
}
