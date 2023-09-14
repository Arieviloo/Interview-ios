//
//  String+Localizable.swift
//  Interview
//
//  Created by Jadië Oliveira on 14/09/23.
//

import Foundation

extension String {
    func localized( fileName: String ) -> String {
        NSLocalizedString(self, tableName: fileName, bundle: .main, value: self, comment: self)
    }
}
