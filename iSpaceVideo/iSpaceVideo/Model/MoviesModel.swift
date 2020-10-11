//
//  MoviesModel.swift
//  iSpaceVideo
//
//  Created by Eugene Berezin on 10/7/20.
//

import Foundation

struct NasaCollection: Codable {
    var collection: Collection
}
// MARK: - Collection
struct Collection: Codable {
    let version: String
    let href: String
    let items: [Item]
}
// MARK: - Item
struct Item: Codable, Identifiable {
    let href: String
    let links: [ItemLink]
    let data: [Datum]
    var id: String {
        href
    }
}
// MARK: - ItemLink
struct ItemLink: Codable {
    let href: String
    let render: Render?
}
// MARK: - Datum
struct Datum: Codable {
    let nasaID: String?
    let myDescription: String?
    let dateCreated: Date?
    let keywords: [String]?
    let title: String?
    
    //Not apart of API
    let location: String?
    let description508: String?
    let photographer: String?
    let secondaryCreator: String?
    let album: [String]?
    
    enum CodingKeys: String, CodingKey {
        case nasaID           = "nasa_id"
        case myDescription    = "description"
        case dateCreated      = "date_created"
        case keywords         = "keywords"
        case title            = "title"
        
        //Not apart of API
        case location
        case description508
        case photographer
        case secondaryCreator
        case album
    }
}
enum Render: String, Codable {
    case image = "image"
}
// MARK: - CollectionLink
struct CollectionLink: Codable {
    let prompt, rel: String?
    let href: String?
}
// MARK: - Metadata
struct Metadata: Codable {
    let totalHits: Int?
    enum CodingKeys: String, CodingKey {
        case totalHits = "total_hits"
    }
}
