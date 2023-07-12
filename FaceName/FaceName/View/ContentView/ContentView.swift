//
//  ContentView.swift
//  FaceName
//
//  Created by Berardino Chiarello on 06/07/23.
//

import SwiftUI

struct ContentView: View {
    
    
    @StateObject var eventsManager = EventsManager()
    
    var body: some View {
        NavigationView{
            List{
                
                ForEach($eventsManager.events, id: \.id) { $event in
                    NavigationLink{
                        EventView(event: $event)
                    }
                label: {
                    ListRowView(event: event)
                }
                }
                .onDelete(perform: removeRows)
                
            }
            .navigationTitle("FaceName")
            .toolbar {
                ToolbarItem (placement: .navigationBarTrailing) {
                    Button {
                        eventsManager.addViewIsShowed = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
            .toolbar{
                EditButton()
            }
            .sheet(isPresented: $eventsManager.addViewIsShowed) {
                AddEventView() { event in
                    eventsManager.addEvent(event)
                }
            }
        }
        .environmentObject(eventsManager)
    }
    
    func removeRows (at offsets: IndexSet) {
        eventsManager.events.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
