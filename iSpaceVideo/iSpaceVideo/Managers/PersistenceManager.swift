//
//  PersistenceManager.swift
//  iSpaceVideo
//
//  Created by Eugene Berezin on 10/12/20.
//

import Foundation
import Combine

class PersistenceManager: ObservableObject{
    static let shared = PersistenceManager()
    public var showAlertForAlreadySavedVideo = false
    private init(){}
    
    @UserDefaultCodable("savedItems", defaultValue: [])
    var savedItems: [Item]{
        willSet {
            objectWillChange.send()
        }
    }
}

@propertyWrapper
public struct UserDefaultCodable<T: Codable> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    public var wrappedValue: T {
        get {
            if let data = UserDefaults.standard.data(forKey: key) {
                if let decoded = try? JSONDecoder().decode(T.self, from: data) {
                    return decoded
                }
            }
            return self.defaultValue
        }
        set {
            if let encoded = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(encoded, forKey: key)
            }
        }
    }
}


