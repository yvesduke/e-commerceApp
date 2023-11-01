//
//  DbCoreDataError.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 31/10/2023.
//

import Foundation

enum CoreDataError: Error {
    case savingError
    case gettingError
}

extension CoreDataError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .savingError:
            return NSLocalizedString("Got Error while savign into DB", comment: "")
        case .gettingError:
            return NSLocalizedString("Got Error while getting data from DB", comment: "")
        }
    }
}
