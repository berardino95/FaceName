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
    @State private var isShowingPhotoPicker = true
    @State private var avatarImage : UIImage?
    @State private var coordinates : (lat: Double, lon: Double) = (0, 0)
    
    @StateObject var locationFetcher = LocationFetcher()

    
    
    var body: some View {
        Group{
            Form {
                Section {
                    HStack{
                        Spacer()
                        VStack{
                            AvatarView(avatarImage: avatarImage)
                                .scaledToFit()
                                .frame(height: 150)
                                .padding(.bottom, 10)
                                .onTapGesture {
                                    isShowingPhotoPicker = true
                                }
                            if avatarImage == nil {
                                Text("Tap the icon to select a photo")
                                    .font(.caption2)
                            }
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
                        var newPerson = Person(firstName: "", lastName: "", base64Avatar: "", latitude: 0, longitude: 0)
                        newPerson.firstName = firstName
                        newPerson.lastName = lastName
                        newPerson.company = company
                        newPerson.base64Avatar = avatarImage?.base64 ?? ""
                        
                        if let location = self.locationFetcher.lastKnownLocation {
                            newPerson.latitude = location.latitude
                            newPerson.longitude = location.longitude
                            
                            print(location)
                        } else {
                            print("No location found")
                        }
                        
                        eventsManager.addPerson(event: event, person: newPerson)
                        dismiss()
                    }
                    .disabled(firstName.isEmpty || lastName.isEmpty || avatarImage == nil || locationFetcher.lastKnownLocation == nil ? true : false)
                }
                
                Section {
                    Text("Loading position...")
                }
                .listRowBackground(Color.clear)
                .opacity(locationFetcher.lastKnownLocation == nil ? 1 : 0)
                
            }
            .autocorrectionDisabled(true)
            .sheet(isPresented: $isShowingPhotoPicker) {
                PhotoPicker(avatarImage: $avatarImage)
            }
            .onAppear{
                self.locationFetcher.start()
            }
        }
    }
}

struct AddPersonView_Previews: PreviewProvider {
    static var previews: some View {
        AddPersonView(event: .constant(Event.example))
    }
}
