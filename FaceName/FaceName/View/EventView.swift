//
//  EventView.swift
//  FaceName
//
//  Created by Berardino Chiarello on 09/07/23.
//

import SwiftUI

struct EventView: View {
    
    @Binding var event: Event
    @ObservedObject var viewModel : ContentView.ViewModel
    @State private var AddPersonIsShowed = false
    
    let layout = [ GridItem(.flexible(minimum: 70)), GridItem(.flexible(minimum: 70)), GridItem(.flexible(minimum: 70))]
    
    
    var body: some View {
        Group{
            if event.people.isEmpty {
                Text("No people added")
            } else {
                ScrollView(.vertical){
                    LazyVGrid(columns: layout, spacing: 30) {
                        ForEach(event.people, id: \.id) { person in
                            NavigationLink(destination: DetailPersonView(event: event, person: person)) {
                                
                                VStack(spacing: 5){
                                    AvatarView(avatarImage: person.avatarImage)
                                        .scaledToFit()
                                        .padding(5)
                                    
                                    VStack{
                                        Text(person.firstName)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(1)
                                        Text(person.lastName)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(1)
                                    }
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding()
                                .background(Color.secondary.opacity(0.2))
                                .cornerRadius(10)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(event.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                AddPersonIsShowed = true
            } label: {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $AddPersonIsShowed) {
            AddPersonView(event: $event, viewModel: viewModel)
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(event: .constant(Event.example), viewModel: ContentView.ViewModel())
    }
}
