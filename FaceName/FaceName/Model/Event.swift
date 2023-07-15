//
//  Event.swift
//  FaceName
//
//  Created by Berardino Chiarello on 06/07/23.
//

import Foundation

struct Event: Codable, Comparable, Identifiable {

    var id = UUID()
    var name: String
    var date: Date
    var people : [Person]
    
    static var emptyExample = Event(name: "Test",date: Date.now, people: [])
    
    static var example = Event(name: "Test",date: Date.now, people: [Person(firstName: "Mario", lastName: "Rossi", base64Avatar: "", latitude: 0, longitude: 0), Person(firstName: "Mario", lastName: "Rossi", base64Avatar: "", latitude: 0, longitude: 0), Person(firstName: "Mario", lastName: "Rossi", base64Avatar: "", latitude: 0, longitude: 0)] )

    static func < (lhs: Event, rhs: Event) -> Bool {
        lhs.date < rhs.date
    }
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        lhs.name == rhs.name
    }
    
}
