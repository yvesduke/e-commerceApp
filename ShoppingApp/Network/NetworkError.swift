//
//  NetworkError.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 24/10/2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case parsingError
    case apiError
    case dataNotFound
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("url is Invalid", comment: "url Error")
        case .parsingError:
            return NSLocalizedString("parsing Error", comment: "parsingError")
        case .dataNotFound:
            return NSLocalizedString("Failed to get data from API", comment: "dataNotFound")
        case .apiError:
            return NSLocalizedString("apiError", comment: "apiError")
        }
    }
}
