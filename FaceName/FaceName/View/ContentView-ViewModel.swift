//
//  ContentView-ViewModel.swift
//  FaceName
//
//  Created by Berardino Chiarello on 06/07/23.
//

import Foundation
extension ContentView{
    @MainActor class ViewModel: ObservableObject {
     
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
        
        func addEvent(){
            let newEvent = Event(name: eventName, people: [])
            events.append(newEvent)
            save()
        }
        
    }
}
