//
//  NarutoWorldLogo.swift
//  NarutoWorld
//
//  Created by Jo Michael on 5/2/23.
//

import SwiftUI

struct NarutoWorldLogo: View {
    var body: some View {
        Image("logo-1")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct NarutoWorldLogo_Previews: PreviewProvider {
    static var previews: some View {
        NarutoWorldLogo()
    }
}
