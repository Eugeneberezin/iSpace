//
//  NetworkManager.swift
//  iSpaceVideo
//
//  Created by Eugene Berezin on 10/8/20.
//

import Foundation
import SwiftUI
import Combine

enum Media: String {
    case video = "&media_type=video"
}

enum URLString: String {
    case baseURL = "https://images-api.nasa.gov/search?q="
}

class NetworkManager {
    
    static let shared = NetworkManager()
    private let mediaType = Media.video.rawValue
    
    func getVideos(searchTerm: String, mediaType: Media) -> AnyPublisher<[Item], Error> {
        
        let endpoint = "\(URLString.baseURL.rawValue)\(searchTerm.lowercased().formatURLString())\(mediaType.rawValue)"
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        debugPrint(endpoint)
        
        guard let url = URL(string: endpoint) else{
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: NasaCollection.self, decoder: decoder)
            .map{$0.collection.items}
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
    
}
