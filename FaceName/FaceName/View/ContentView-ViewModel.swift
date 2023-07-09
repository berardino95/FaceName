//
//  ContentView-ViewModel.swift
//  FaceName
//
//  Created by Berardino Chiarello on 06/07/23.
//

import Foundation
extension ContentView{
    @MainActor class ViewModel: ObservableObject  {
     
        let savePath = FileManager.documentDirectory.appendingPathComponent("SavedEvent")
        
        @Published var events = [Event]()
        
        @Published var eventName = ""
        
        //Add sheet
        @Published  var addViewIsShowed = false
        
        init(){
            do {
                let data = try Data(contentsOf: savePath)
                events = try JSONDecoder().decode([Event].self, from: data)
            } catch {
                events = []
            }
        }
        
        func save(){
            do {
                let data = try JSONEncoder().encode(events)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data")
            }
        }
        
        func addEvent(_ event: Event){
            let newEvent = event
            events.append(newEvent)
            save()
        }
        
        func removeRows (at offsets: IndexSet) {
            events.remove(atOffsets: offsets)
        }
        
    }
}
