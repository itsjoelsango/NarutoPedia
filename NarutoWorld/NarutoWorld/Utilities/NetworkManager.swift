//
//  NetworkManager.swift
//  NarutoWorld
//
//  Created by Jo Michael on 4/29/23.
//

import Foundation

enum RequestError: Error {
    case noFound
    case badRequest
    case uncategorized
    case decodingError
}


class NetworkManager {
    private init() {}
    
    static let shared = NetworkManager()
    
    func fetch<T: Codable>(url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw RequestError.badRequest
        }
        
        guard let decodedObject = try? JSONDecoder().decode(T.self, from: data) else {
            print("error decoding")
            throw RequestError.decodingError
        }
        return decodedObject
    }
}
