//
//  FavoriteRow.swift
//  NarutoWorld
//
//  Created by Jo Michael on 5/3/23.
//

import SwiftUI

struct FavoriteItemRow: View {
    var characterItem: CharacterItem
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: characterItem.image[0])) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 88, height: 88)
                    .clipped()
                
            } placeholder: {
                ProgressView()
                    .frame(width: 88, height: 88)
            }
            .cornerRadius(20)

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

struct FavoriteRow_Previews: PreviewProvider {
    static var characterItems = ModelData().characters
    
    static var previews: some View {
        FavoriteItemRow(characterItem: characterItems[1])
    }
}
