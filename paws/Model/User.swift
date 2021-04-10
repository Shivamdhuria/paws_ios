//
//  User.swift
//  paws
//
//  Created by Shivam Dhuria on 10/04/21.
//

import Foundation
import SwiftUI

struct User : Decodable, Identifiable {
    let id : Int
    let name :String
}
