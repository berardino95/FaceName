//
//  AddPeopleView.swift
//  FaceName
//
//  Created by Berardino Chiarello on 09/07/23.
//

import SwiftUI

struct AddPersonView: View {
    
    var event: Event
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var company = ""
    
    
    var body: some View {
        Form {
            Section{
                TextField("First name", text: $firstName)
                TextField("Last name", text: $lastName)
            }
            Section ("optional") {
                TextField("Company", text: $company)
            }
            
            Section {
                Button ("Add") {
                    var newPerson = Person(firstName: "", lastName: "")
                    newPerson.firstName = firstName
                    newPerson.lastName = lastName
                    
                    //event.people.append(newPerson)
                }
            }
        }
    }
}

struct AddPersonView_Previews: PreviewProvider {
    static var previews: some View {
        AddPersonView(event: Event.example)
    }
}
