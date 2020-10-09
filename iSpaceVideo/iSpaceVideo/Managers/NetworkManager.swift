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
    private let mediaType = MediaType.video.rawValue
    
    func getVideos(completed: @escaping (Result<NasaCollection, Error>)-> Void) {
        let endpoint = "https://images-api.nasa.gov/search?q=apollo%2011&media_type=video"
        
        guard let url = URL(string: endpoint) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completed(.failure(error?.localizedDescription as! Error))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(error?.localizedDescription as! Error))
                return
            }
            
            guard let data = data else {
                completed(.failure(error?.localizedDescription as! Error))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let videos = try decoder.decode(NasaCollection.self, from: data)
                completed(.success(videos))

            } catch {
                print(error)

            }
        
        }
        task.resume()
        
    }
    
    
}
