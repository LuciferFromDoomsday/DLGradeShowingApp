//
//  Subject.swift
//  DLForHuman
//
//  Created by admin on 7/10/20.
//  Copyright © 2020 Naimankhan Ayan. All rights reserved.
//

import Foundation

struct Subject : Decodable , Hashable {
  var name : String
    var link : String
    var finalGrade : String
    
    init( name : String, link :String, finalGrade : String ) {
        
        self.name = name
        self.link = link
        self.finalGrade = finalGrade
    }
}
