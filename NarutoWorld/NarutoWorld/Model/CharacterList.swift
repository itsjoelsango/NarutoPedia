//
//  CharacterList.swift
//  NarutoWorld
//
//  Created by Jo Michael on 4/29/23.
//

import Foundation

struct CharacterList: Codable {
    let characters: [CharacterItem]
    
    enum CodingKeys: String, CodingKey {
        case characters = "characters"
    }
}
