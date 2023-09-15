//
//  String+Localizable.swift
//  Interview
//
//  Created by Jadië Oliveira on 14/09/23.
//

import Foundation

extension String {
    init(localizedKey:String) {
        let initText = NSLocalizedString(localizedKey, comment: "")
        self.init(initText)
    }
}
