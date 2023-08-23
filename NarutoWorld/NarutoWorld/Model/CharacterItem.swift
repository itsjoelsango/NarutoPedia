//
//  CharacterItem.swift
//  NarutoWorld
//
//  Created by JS on 4/29/23.
//

import Foundation

struct CharacterItem: Hashable, Identifiable, Codable {
    let id: Int
    let name: String
    let image: [String]
    let description: [String]
    var isFavorite: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image = "images"
        case description = "about"
        case isFavorite
    }
}
