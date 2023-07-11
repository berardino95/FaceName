//
//  PersonDetailView.swift
//  FaceName
//
//  Created by Berardino Chiarello on 10/07/23.
//

import SwiftUI

struct EditPersonView: View {
    
    var event: Event
    var person: Person
    
    @ObservedObject var viewModel : ContentView.ViewModel
    
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
                        var newPerson = Person(firstName: "", lastName: "", base64Avatar: "")
                        newPerson.firstName = firstName
                        newPerson.lastName = lastName
                        newPerson.base64Avatar = avatarImage?.base64 ?? ""
                        
                        viewModel.addPerson(event: event, person: newPerson)
                        dismiss()
                    }
                }
                
            }
            .sheet(isPresented: $isShowingPhotoPicker) {
                PhotoPicker(avatarImage: $avatarImage)
            }
        }
    }
    
    init(event: Event, person: Person,viewModel: ContentView.ViewModel, firsName: String, lastName: String, company: String, avatarImage: UIImage?){
        self.event = event
        self.person = person
        self.viewModel = viewModel
        
        _firstName = State(initialValue: person.firstName)
        _lastName = State(initialValue: person.lastName)
        _company = State(initialValue: person.company ?? "")
        _avatarImage = State(initialValue: person.avatarImage)

    }
    
}

struct EditPersonView_Previews: PreviewProvider {
    static var previews: some View {
        EditPersonView(event: Event.example , person: Person.example , viewModel: ContentView.ViewModel(), firsName: "Berardino", lastName: "Chiarello", company: "Sky", avatarImage: nil)
    }
}
