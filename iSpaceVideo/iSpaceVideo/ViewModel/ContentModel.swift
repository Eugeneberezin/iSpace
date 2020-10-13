//
//  ContentModel.swift
//  iSpaceVideo
//
//  Created by Eugene Berezin on 10/10/20.
//

import Foundation
import SwiftUI
import Combine

class ContentModel: ObservableObject {
     @Published var items = [Item]()
     @Published var isActivityIndicatorShowing = false
     @Published var text = ""
     @Published var errorMessage = ""
     @Published var showAlert = false
     @Published var error: Error?
     private var subscriptions = Set<AnyCancellable>()
    
    init() {}
    
    func getVideos(for searchTerm: String) {
        self.isActivityIndicatorShowing = true
        NetworkManager.shared.getVideos(searchTerm: searchTerm, mediaType: Media.video)
            .sink(receiveCompletion: { [weak self] in
                if case .failure(let error) = $0{
                    self?.error = error
                    self?.showAlert = true
                }
            }, receiveValue: { [weak self] items in
                self?.isActivityIndicatorShowing = false
                    self?.items = items
            }).store(in: &subscriptions)

    }
    
}
