//
//  AddPeopleView.swift
//  FaceName
//
//  Created by Berardino Chiarello on 09/07/23.
//

import SwiftUI

struct AddPersonView: View {
    
    
    @Environment(\.dismiss) var dismiss
    @Binding var event: Event
    
    @EnvironmentObject var eventsManager : EventsManager
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var company = ""
    @State private var isShowingPhotoPicker = false
    @State private var avatarImage : UIImage?
    
    
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
                    Button ("Add") {
                        var newPerson = Person(firstName: "", lastName: "", base64Avatar: "")
                        newPerson.firstName = firstName
                        newPerson.lastName = lastName
                        newPerson.company = company
                        newPerson.base64Avatar = avatarImage?.base64 ?? ""
                        
                        eventsManager.addPerson(event: event, person: newPerson)
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
}

struct AddPersonView_Previews: PreviewProvider {
    static var previews: some View {
        AddPersonView(event: .constant(Event.example))
    }
}
