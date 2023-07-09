//
//  Person.swift
//  FaceName
//
//  Created by Berardino Chiarello on 06/07/23.
//

import Foundation
import SwiftUI

struct Person: Codable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var company: String?

}
