//
//  Person.swift
//  FaceName
//
//  Created by Berardino Chiarello on 06/07/23.
//

import CoreLocation
import Foundation
import MapKit
import SwiftUI

struct Person: Codable, Identifiable, Comparable {
 
    var id = UUID()
    var firstName: String
    var lastName: String
    var company: String?
    var base64Avatar : String
    var latitude: Double
    var longitude: Double
    
    var avatarImage : UIImage? {
        if let img = base64Avatar.imageFromBase64 {
            return img
        } else {
            return nil
        }
        
    }
    
    var coordinate : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    

    
    static func < (lhs: Person, rhs: Person) -> Bool {
        lhs.firstName < rhs.lastName
    }
    
    
    
    static var example = Person(firstName: "Berardino", lastName: "Chiarello", base64Avatar: "", latitude: 50, longitude: 50)

}
