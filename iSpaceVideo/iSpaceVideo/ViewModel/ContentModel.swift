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
     @Published var text = ""
     @Published var errorMessage = ""
     @Published var showAlert = false
    
    init() {}
    
    func getVideos(for searchTerm: String) {
        self.isActivityIndicatorShowing = true
        NetworkManager.shared.getVideos(searchTerm: text, mediaType: Media.video) { result in
    
            switch result {
            case .success(let items):
                DispatchQueue.main.async {
                    self.isActivityIndicatorShowing = false
                    self.items = items
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self.isActivityIndicatorShowing = false
                    self.showAlert.toggle()
                    self.errorMessage = error.localizedDescription
                }
                debugPrint(error)
            }
        }
    }
    
    func save(item: Item) {
        savedItems.append(item)
    }
    
    func delete(item: Item) {
        if let index = savedItems.firstIndex(of: item) {
            savedItems.remove(at: index)
        }
    }
    
}
