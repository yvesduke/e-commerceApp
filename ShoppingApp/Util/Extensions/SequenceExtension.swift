//
//  SequenceExtension.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 26/10/2023.
//

import Foundation

extension Sequence where Element: Hashable {
    func removeDuplicates() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
