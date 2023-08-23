//
//  CharacterDetail.swift
//  NarutoWorld
//
//  Created by Jo Michael on 5/3/23.
//

import SwiftUI

struct CharacterDetail: View {
    @EnvironmentObject var modelData: ModelData
    var characterItem: CharacterItem
    
    var characterItemIndex: Int {
        modelData.characters.firstIndex(where: {$0.id == characterItem.id })!
    }
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                AsyncImage(url: URL(string: characterItem.image[0])) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                    
                } placeholder: {
                    ProgressView()
                        .frame(width: 44, height: 44)
                }
                .frame(maxWidth: .infinity, minHeight: 340)
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(characterItem.name)
                            .font(.title)
                        FavoriteButton(isSet: $modelData.characters[characterItemIndex].isFavorite)
                    }
                    
                    Divider()
                    
                    Text(characterItem.description[0].appending(characterItem.description[1]))
                }
                .padding([.leading, .trailing], 20)
            }
        }
        .scrollIndicators(.hidden)
        .navigationTitle(characterItem.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CharacterDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        CharacterDetail(characterItem: ModelData().characters[1])
            .environmentObject(modelData)
    }
}
