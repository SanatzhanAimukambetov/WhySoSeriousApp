//
//  JokeModel.swift
//  WhySoSeriousApp
//
//  Created by Sanatzhan Aimukambetov on 14.12.2020.
//

import Foundation

struct Joke: Decodable {
    
    var id: Int?
    var type: String?
    var setup: String?
    var joke: String?
    
    private enum CodingKeys: String, CodingKey {
        case id, type, setup
        case joke = "punchline"
    }
    
}
