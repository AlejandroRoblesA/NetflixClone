//
//  Extensions.swift
//  NetflixClone
//
//  Created by Alejandro Robles on 04/07/23.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
