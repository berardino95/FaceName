//
//  Event.swift
//  FaceName
//
//  Created by Berardino Chiarello on 06/07/23.
//

import Foundation

struct Event: Codable {
    var id = UUID()
    var name: String
    var people : [Person]
}
