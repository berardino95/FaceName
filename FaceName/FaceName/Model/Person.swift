//
//  Person.swift
//  FaceName
//
//  Created by Berardino Chiarello on 06/07/23.
//

import Foundation
import SwiftUI

struct Person: Codable, Identifiable, Comparable {
    
    
    var id = UUID()
    var firstName: String
    var lastName: String
    var company: String?
    var base64Avatar : String
    
    var avatarImage : UIImage? {
        if let img = base64Avatar.imageFromBase64 {
            return img
        } else {
            return nil
        }
        
    }
    
    static var example = Person(firstName: "Berardino", lastName: "Chiarello", base64Avatar: "")
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        lhs.firstName < rhs.lastName
    }

}
