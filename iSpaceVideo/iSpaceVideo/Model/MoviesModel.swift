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
struct Item: Codable {
    let href: String
    let links: [ItemLink]
    let data: [Datum]
    
}

// MARK: - ItemLink
struct ItemLink: Codable {
    let href: String
    let render: Render?
    
    
}

// MARK: - Datum
struct Datum: Codable {
    let datumDescription: String
    let dateCreated: Date
    let mediaType: MediaType
    let keywords: [String]
    let nasaID: String
    let center: Center
    let title: String
    let location, description508, photographer, secondaryCreator: String?
    let album: [String]?

    enum CodingKeys: String, CodingKey {
        case datumDescription = "description"
        case dateCreated = "date_created"
        case mediaType = "media_type"
        case keywords
        case nasaID = "nasa_id"
        case center, title, location
        case description508 = "description_508"
        case photographer
        case secondaryCreator = "secondary_creator"
        case album
    }
}

enum MediaType: String, Codable {
    case video = "video"
}

struct Center: Codable {
    var arc = "ARC"
    var gsfc = "GSFC"
    var hq = "HQ"
    var jpl = "JPL"
    var ksc = "KSC"
}

enum Render: String, Codable {
    case image = "image"
}

// MARK: - CollectionLink
struct CollectionLink: Codable {
    let prompt, rel: String
    let href: String
}

// MARK: - Metadata
struct Metadata: Codable {
    let totalHits: Int

    enum CodingKeys: String, CodingKey {
        case totalHits = "total_hits"
    }
}
