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
            List(0..<3){name in
                NavigationLink{Text("Event \(name)")}
            label: {
                
                Text("Event \(name)")
            }
            }
            .scrollContentBackground(.hidden)
            
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
