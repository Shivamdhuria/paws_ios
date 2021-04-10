//
//  UserEndpoint.swift
//  paws
//
//  Created by Shivam Dhuria on 10/04/21.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest {get}
    var baseUrl:URL{get}
    var path: String {get}
}

enum UserAPI {
    case getUsers
}

extension UserAPI:APIBuilder{
    
    var baseUrl: URL {
        switch self {
        case .getUsers:
            return URL(string: "https://jsonplaceholder.typicode.com")!
        }
    }
    
    var path: String {
        return "/users"
    }
    
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
    }
}
