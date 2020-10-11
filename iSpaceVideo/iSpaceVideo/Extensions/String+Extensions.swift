//
//  String+Extensions.swift
//  iSpaceVideo
//
//  Created by Eugene Berezin on 10/10/20.
//

import Foundation

extension String {
    func formatURLString() -> String {
        self.replacingOccurrences(of: " ", with: "%20")
    }
}
