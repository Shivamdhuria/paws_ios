//
//  ResultState.swift
//  paws
//
//  Created by Shivam Dhuria on 10/04/21.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [User])
    case failed(error:Error )
}
