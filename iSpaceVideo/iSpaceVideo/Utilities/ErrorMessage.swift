//
//  ErrorMessage.swift
//  iSpaceVideo
//
//  Created by Eugene Berezin on 10/8/20.
//

import Foundation

enum NetworkError: LocalizedError{
    case response
    case data
    case decoding
    case invalidURL
    case notFound
    case serverError
    
    var errorDescription: String? {
        switch self {
        case .response:
            return "Something went wrong. Please try again"
        case .data:
            return "There was a problem with your request. Please try again"
        case .decoding:
            return "Something went wrong. Please try again"
        case .invalidURL:
            return "Sorry we couldn't find anything. Please try a different search search phrase"
        case .notFound:
            return "Sorry we couldn't find what you're looking for"
        case .serverError:
            return "Something went wrong please try again"
        }
    }
}


