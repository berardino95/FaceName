//
//  DetailPersonView.swift
//  FaceName
//
//  Created by Berardino Chiarello on 11/07/23.
//

import SwiftUI


struct DetailPersonView: View {
    
    
    var event: Event
    var person : Person
    
    @EnvironmentObject var eventsManager : EventsManager
    @State private var editSheetIsPresented = false
    
    @State private var showAlert = false
    
    var body: some View {
        VStack{
            
            AvatarView(avatarImage: person.avatarImage)
                .scaledToFit()
                .frame(height: 150)
                .padding(.vertical)
            
            Text("\(person.firstName) \(person.lastName)")
                .font(.title3)
            Text(person.company ?? "")
            Spacer()
        }
        .padding(.vertical)
        .toolbar {
            ToolbarItem{
                Button {
                    editSheetIsPresented = true
                } label: {
                    Image(systemName: "x.circle")
                        .foregroundColor(.red)
                }
            }
            
            ToolbarItem{
                Button {
                    editSheetIsPresented = true
                } label: {
                    Image(systemName: "pencil.tip.crop.circle")
                }
            }
        }
        .alert("Vuoi eliminare", isPresented: $editSheetIsPresented, actions: {
            Button("No", role: .cancel) {}
            Button("Ok", role: .destructive) { eventsManager.removePerson(event: event, person: person)  }
        }, message: {
            Text("\(person.firstName) \(person.lastName)?")
        })
        .sheet(isPresented: $editSheetIsPresented) {
            EditPersonView(event: event, person: person)
        }
    }
}

struct DetailPersonView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPersonView(event: Event.example, person: Person.example)
    }
}
