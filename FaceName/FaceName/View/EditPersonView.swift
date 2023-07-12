//
//  PersonDetailView.swift
//  FaceName
//
//  Created by Berardino Chiarello on 10/07/23.
//

import SwiftUI

struct EditPersonView: View {
    
    
    
    @EnvironmentObject var eventsManager : EventsManager
    
    var event: Event
    var person: Person
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var company = ""
    @State private var isShowingPhotoPicker = false
    @State private var avatarImage : UIImage?
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Group{
            Form {
                Section {
                    HStack{
                        Spacer()
                        AvatarView(avatarImage: avatarImage)
                            .scaledToFit()
                            .frame(height: 150)
                            .onTapGesture {
                                isShowingPhotoPicker = true
                            }
                        Spacer()
                    }
                }
                .listRowBackground(Color.clear)
                
                Section{
                    TextField("First name", text: $firstName)
                    TextField("Last name", text: $lastName)
                }
                Section ("optional") {
                    TextField("Company", text: $company)
                }
                
                Section {
                    Button ("Save") {
                        var updatedPerson = Person(firstName: "", lastName: "", base64Avatar: "")
                        updatedPerson.firstName = firstName
                        updatedPerson.lastName = lastName
                        updatedPerson.company = company
                        updatedPerson.base64Avatar = avatarImage?.base64 ?? ""
                        
                        eventsManager.updatePerson(event: event, person: person, newPerson: updatedPerson)
                        dismiss()
                    }
                }
                
            }
            .autocorrectionDisabled(true)
            .sheet(isPresented: $isShowingPhotoPicker) {
                PhotoPicker(avatarImage: $avatarImage)
            }
        }
    }
    
    init(event: Event, person: Person){
        self.event = event
        self.person = person
        
        _firstName = State(initialValue: person.firstName)
        _lastName = State(initialValue: person.lastName)
        _company = State(initialValue: person.company ?? "")
        _avatarImage = State(initialValue: person.avatarImage)

    }
    
}

struct EditPersonView_Previews: PreviewProvider {
    static var previews: some View {
        EditPersonView(event: Event.example , person: Person.example)
    }
}
