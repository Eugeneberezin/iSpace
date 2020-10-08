//
//  MoviesModel.swift
//  iSpaceVideo
//
//  Created by Eugene Berezin on 10/7/20.
//

import Foundation

struct Collection: Codable {
    var items: [Items]
    
}

struct Items: Codable, Identifiable {
    var id = UUID()
    var href: String
    var links: [Link]
    var data: [ItemData]
}

struct Link: Codable {
    var href: String?
    var render: String?
    var rel: String?
}

struct ItemData: Codable {
    var description: String
    var title: String
}
