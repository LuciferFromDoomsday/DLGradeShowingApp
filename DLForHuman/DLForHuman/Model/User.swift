//
//  User.swift
//  DLForHuman
//
//  Created by admin on 7/6/20.
//  Copyright © 2020 Naimankhan Ayan. All rights reserved.
//

import Foundation

struct User : Identifiable , Decodable {
    var id : String
//    static var currentUser : User = User(id: "null", name: "null")
var name : String
init(id : String , name : String ) {
        self.id = id
        self.name = name
   // User.currentUser = self
    }
}
