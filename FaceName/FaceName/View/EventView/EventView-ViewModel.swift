//
//  EventView-ViewModel.swift
//  FaceName
//
//  Created by Berardino Chiarello on 11/07/23.
//

import Foundation

extension EventView {
    
    @MainActor class ViewModel : ObservableObject {
        
        @Published var event : Event
        
        @Published var AddPersonIsShowed = false
        
        init(event: Event, AddPersonIsShowed: Bool = false) {
            self.event = event
            self.AddPersonIsShowed = AddPersonIsShowed
        }
        
    }
    
    
}
