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
    
    var errorDescription: String? {
        switch self {
        case .response:
            return "The response is invalid"
        case .data:
            return "The data is not available"
        case .decoding:
            return "The decoder failed"
        case .invalidURL:
            return "The url is invalid"
        }
    }
}


