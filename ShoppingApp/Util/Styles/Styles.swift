//
//  Styles.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 24/10/2023.
//

import Foundation
import SwiftUI


// MARK: Spacing ====================
enum Spacing: CGFloat {
    case space_sm = 9
    case space_md = 12
    case space_lg = 15
    case space_xlg = 21
}


// MARK: Colors =====================
enum Coloring {
    case color_1
    case color_2
    case color_3
    case color_4
}


extension Coloring: RawRepresentable {
    
    typealias RawValue = UIColor
    
    init?(rawValue: RawValue) {
        switch rawValue {
        case #colorLiteral(red: 0.18, green: 0.60, blue: 0.30, alpha: 1.00) : self = .color_1
          case #colorLiteral(red: 0.18, green: 0.60, blue: 0.30, alpha: 0.07) : self = .color_2
          case #colorLiteral(red: 0.15, green: 0.66, blue: 0.18, alpha: 1.00) : self = .color_3
          case #colorLiteral(red: 0.15, green: 0.66, blue: 0.18, alpha: 1.00) : self = .color_4
          default: return nil
        }
    }
    
    var rawValue: RawValue {
        switch self {
        case .color_1 : return #colorLiteral(red: 0.18, green: 0.60, blue: 0.30, alpha: 1.00)
        case .color_2 : return #colorLiteral(red: 0.18, green: 0.60, blue: 0.30, alpha: 0.07)
        case .color_3 : return #colorLiteral(red: 0.15, green: 0.66, blue: 0.18, alpha: 1.00)
        case .color_4 : return #colorLiteral(red: 0.15, green: 0.66, blue: 0.18, alpha: 1.00)
        }
    }
}
