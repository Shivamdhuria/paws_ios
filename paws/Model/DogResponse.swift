//
//  DogResponse.swift
//  paws
//
//  Created by Shivam Dhuria on 10/04/21.
//

import Foundation

struct DogResponse : Decodable{
    let message : [String]
    let status :String
}
