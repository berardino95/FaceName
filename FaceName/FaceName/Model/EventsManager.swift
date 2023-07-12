//
//  ContentView-ViewModel.swift
//  FaceName
//
//  Created by Berardino Chiarello on 06/07/23.
//

import Foundation
import SwiftUI

@MainActor class EventsManager: ObservableObject  {
        
        let savePath = FileManager.documentDirectory.appendingPathComponent("SavedEvent")
        
        @Published var events = [Event]()
        
        
        @Published var eventName = ""
        
        //Add sheet presented
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
        
        func addPerson (event: Event, person: Person) {
            if let index = events.firstIndex(of: event) {
                events[index].people.append(person)
                save()
            }
        }
        
        func removePerson (event: Event, person: Person){
            if let eventIndex = events.firstIndex(of: event) {
                if let personIndex = event.people.firstIndex(of: person) {
                    events[eventIndex].people.remove(at: personIndex)
                    save()
                }
            }
        }
    
    func updatePerson(event: Event, person: Person, newPerson: Person){
        if let eventIndex = events.firstIndex(of: event) {
            if let personIndex = event.people.firstIndex(of: person) {
                events[eventIndex].people[personIndex] = newPerson
                save()
            }
        }
    }
        
        func addEvent(_ event: Event){
            let newEvent = event
            events.append(newEvent)
            save()
        }
    }
