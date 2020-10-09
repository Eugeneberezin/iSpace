//
//  NetworkManager.swift
//  iSpaceVideo
//
//  Created by Eugene Berezin on 10/8/20.
//

import Foundation
import SwiftUI

enum Media: String {
    case video = "&media_type=video"
}

enum URLString: String {
    case baseURL = "https://images-api.nasa.gov/search?q="
}

class NetworkManager {
    
    static let shared = NetworkManager()
    private let mediaType = Media.video.rawValue
    
    func getVideos(completed: @escaping (Result<[Item], Error>)-> Void) {
        let endpoint = "https://images-api.nasa.gov/search?q=apollo%2011&media_type=video"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completed(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(NetworkError.response))
                return
            }
            
            guard let data = data else {
                completed(.failure(NetworkError.data))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let results = try decoder.decode(NasaCollection.self, from: data)
                completed(.success(results.collection.items))
            } catch {
                completed(.failure(NetworkError.decoding))
            }
        }.resume()
    }

    
    
}
