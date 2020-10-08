//
//  View+Extensions.swift
//  iNasaVideo
//
//  Created by Eugene Berezin on 10/5/20.
//

import Foundation
import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
