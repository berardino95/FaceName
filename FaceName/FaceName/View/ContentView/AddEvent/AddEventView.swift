//
//  AddEventView.swift
//  FaceName
//
//  Created by Berardino Chiarello on 07/07/23.
//

import SwiftUI

struct AddEventView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var date = Date.now
    
    var addEvent : (Event) -> Void
    
    var body: some View {
        NavigationView {
            
            Form{
                TextField("Event name", text: $name)
                DatePicker("Event date", selection: $date, displayedComponents: .date)
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        var newEvent = Event(name: "",date: Date.now, people: [])
                        newEvent.name = name
                        newEvent.date = date
                        addEvent(newEvent)
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark.circle")
                    }
                    .disabled(name.isEmpty ? true : false)
                }
            }
            .navigationTitle("Create a new event")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    init(addEvent : @escaping (Event) -> Void) {
        self.addEvent = addEvent
    }
    
}

struct AddEventView_Previews: PreviewProvider {
    static var previews: some View {
        AddEventView() { _ in }
    }
}
