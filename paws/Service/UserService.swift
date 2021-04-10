//
//  UserService.swift
//  paws
//
//  Created by Shivam Dhuria on 10/04/21.
//

import Foundation
import Combine

protocol UserService {
    func request(from endpoint : UserAPI) -> AnyPublisher<DogResponse, APIError>
}

struct UserServiceImpl: UserService {
    
    func request(from endpoint: UserAPI) -> AnyPublisher<DogResponse, APIError> {
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError{_ in APIError.unknown}
            .flatMap{ data, response -> AnyPublisher<DogResponse, APIError> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error : APIError.unknown).eraseToAnyPublisher()
                }
                if (200 ... 299).contains(response.statusCode){
                    return Just(data)
                        .decode(type: DogResponse.self, decoder: JSONDecoder())
                        .mapError{_ in APIError.decodingError}
                        .eraseToAnyPublisher()
                    
                } else {
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
                
            }
            .eraseToAnyPublisher()
    }
    
    
}
//enum APIError: Error {
//    case decodingError
//    case errorCode(Int)
//    case unknown
//}
//
//extension APIError :  LocalizedError {
//    var errorDescription: String? {
//        switch self {
//        case .decodingError:
//            return "Failed to decode"
//        case .errorCode(let code):
//            return "\(code) - something went wrong"
//        case .unknown:
//            return "The error is unknown"
//        }
//    }
//}
