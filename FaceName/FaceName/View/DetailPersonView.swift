//
//  DetailPersonView.swift
//  FaceName
//
//  Created by Berardino Chiarello on 11/07/23.
//

import MapKit
import SwiftUI


struct DetailPersonView: View {
    
    
    var event: Event
    var person : Person
    
    @EnvironmentObject var eventsManager : EventsManager
    @State private var editSheetIsPresented = false
    @State private var deleteSheetIsPresented = false
    
    @State private var showAlert = false
    
    @State private var region : MKCoordinateRegion
    
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
            
            Map(coordinateRegion: $region, annotationItems: [person]) { place in
                MapAnnotation(coordinate: place.coordinate) {
                    Circle()
                        .strokeBorder(.red, lineWidth: 3)
                        .background(Circle().fill(.white))
                        .frame(width: 20, height: 20)
                    
                }
            }
            .frame(height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            
            Spacer()
            
        }
        .ignoresSafeArea(edges: .bottom)
        .padding(.vertical)
        .toolbar {
            ToolbarItem{
                Button {
                    deleteSheetIsPresented = true
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
        .alert("Vuoi eliminare", isPresented: $deleteSheetIsPresented, actions: {
            Button("No", role: .cancel) {}
            Button("Ok", role: .destructive) { eventsManager.removePerson(event: event, person: person)  }
        }, message: {
            Text("\(person.firstName) \(person.lastName)?")
        })
        .sheet(isPresented: $editSheetIsPresented) {
            EditPersonView(event: event, person: person)
        }
        .onAppear{
            print(person.latitude)
            print(person.longitude)
        }
    }
    
    init(event: Event, person: Person) {
        self.event = event
        self.person = person
        
        _region = State(initialValue: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: person.latitude, longitude: person.longitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))
        
    }
    
}

struct DetailPersonView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPersonView(event: Event.example, person: Person.example)
    }
}
