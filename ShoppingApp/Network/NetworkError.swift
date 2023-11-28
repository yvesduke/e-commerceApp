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
    case loginError
    case singUpError
    case passwordResetError
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
        case .loginError:
            return NSLocalizedString("Failed to login", comment: "LoginError")
        case .singUpError:
            return NSLocalizedString("Failed to signup", comment: "SignupError")
        case .passwordResetError:
            return NSLocalizedString("Failed to reset password", comment: "PasswordResetError")
        }
    }
}
