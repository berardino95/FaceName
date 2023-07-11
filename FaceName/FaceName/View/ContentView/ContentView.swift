//
//  ContentView.swift
//  FaceName
//
//  Created by Berardino Chiarello on 06/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            List{
                
                ForEach($viewModel.events, id: \.id) { $event in
                    NavigationLink{
                        EventView(event: $event, viewModel: viewModel)
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
                        viewModel.addViewIsShowed = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $viewModel.addViewIsShowed) {
                AddEventView() { event in
                    viewModel.addEvent(event)
                }
            }
        }
    }
    
    func removeRows (at offsets: IndexSet) {
        viewModel.events.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
