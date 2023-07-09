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
                ForEach(viewModel.events.sorted().reversed(), id: \.id) {  event in
                    NavigationLink{
                        EventView(event: event)
                    }
                label: {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(event.name)
                            .font(.title2.bold())
                        Text(event.date, style: .date)
                            .font(.caption)
                    }
                }
                }
                .onDelete(perform: viewModel.removeRows)
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
