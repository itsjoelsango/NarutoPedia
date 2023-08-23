//
//  Home.swift
//  NarutoWorld
//
//  Created by Jo Michael on 4/28/23.
//

import SwiftUI

struct Home: View {
    @State private var selection: Tab = .discover
    
    enum Tab {
        case discover
        case favorite
    }
    
    var body: some View {
        TabView(selection: $selection) {
            Discover()
                .tabItem {
                    Label("Discover", systemImage: "flame")
                }
                .tag(Tab.discover)
            
            FavoriteList()
                .tabItem {
                    Label("Favorite", systemImage: "bolt.heart")
                }
                .tag(Tab.favorite)
        }
        .navigationBarBackButtonHidden(true)
        .listStyle(.plain)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(ModelData())
    }
}
