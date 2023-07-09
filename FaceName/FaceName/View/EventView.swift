//
//  EventView.swift
//  FaceName
//
//  Created by Berardino Chiarello on 09/07/23.
//

import SwiftUI

struct EventView: View {
    
    var event: Event
    @State private var AddPersonIsShowed = false
    
    let layout = [ GridItem(.adaptive(minimum: 100, maximum: 100), spacing: 20)]
    
    
    var body: some View {
            Group{
                if event.people.isEmpty {
                    Text("No people added")
                } else {
                    ScrollView(.vertical){
                        LazyVGrid(columns: layout, spacing: 20) {
                            ForEach(event.people, id: \.id) { person in
                                VStack(spacing: 20){
                                    Image(systemName: "person.fill")
                                        .font(.title)
                                    Text(person.firstName)
                                        .multilineTextAlignment(.center)
                                    Text(person.lastName)
                                        .multilineTextAlignment(.center)
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding()
                                .background(Color.secondary)
                                .cornerRadius(10)
                            }
                        }
                    }
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
                AddPersonView(event: event)
            }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(event: Event.emptyExample)
    }
}
