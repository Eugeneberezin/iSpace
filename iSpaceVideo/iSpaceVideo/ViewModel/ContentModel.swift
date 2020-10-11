//
//  ContentModel.swift
//  iSpaceVideo
//
//  Created by Eugene Berezin on 10/10/20.
//

import Foundation
import SwiftUI

class ContentModel: ObservableObject {
     @Published var items = [Item]()
     @Published var savedItems = [Item]()
     @Published var isActivityIndicatorShowing = false
    
    init() {}
    
    func getVideos(for searchTerm: String) {
        self.isActivityIndicatorShowing = true
        NetworkManager.shared.getVideos(searchTerm: searchTerm, mediaType: Media.video) { result in
    
            switch result {
            case .success(let items):
                DispatchQueue.main.async {
                    self.isActivityIndicatorShowing = false
                    self.items = items
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self.isActivityIndicatorShowing = false
                }
                debugPrint(error)
            }
        }
    }
    
}
