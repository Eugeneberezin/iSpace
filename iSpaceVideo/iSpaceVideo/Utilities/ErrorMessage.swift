//
//  ErrorMessage.swift
//  iSpaceVideo
//
//  Created by Eugene Berezin on 10/8/20.
//

import Foundation

enum ErrorMessage: String, Error {
    case badRequest = "Oops... It's not you, it's us. Please try again"
    case notFound = "We couldn't find what you're looking for. Try again"
    case serverError = "We're experiencing technical difficulties. Please try again later"
}

