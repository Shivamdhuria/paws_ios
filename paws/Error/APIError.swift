//
//  APIError.swift
//  paws
//
//  Created by Shivam Dhuria on 10/04/21.
//

import Foundation

enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}

extension APIError :  LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Failed to decode json from service"
        case .errorCode(let code):
            return "\(code) - something went wrong"
        case .unknown:
            return "The error is unknown"
        }
    }
}
