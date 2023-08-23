//
//  FavoriteButton.swift
//  NarutoWorld
//
//  Created by Jo Michael on 5/4/23.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "hand.thumbsup.fill" : "hand.thumbsup")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .red : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
