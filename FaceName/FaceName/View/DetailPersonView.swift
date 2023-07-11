//
//  DetailPersonView.swift
//  FaceName
//
//  Created by Berardino Chiarello on 11/07/23.
//

import SwiftUI


struct DetailPersonView: View {
    
    
    var event: Event
    var person : Person
    
    var body: some View {
        VStack{
            
            AvatarView(avatarImage: person.avatarImage)
                .frame(height: 150)
                .scaledToFit()
                .padding(.vertical)
            
            Text("\(person.firstName) \(person.lastName)")
                .font(.title3)
            Text(person.company ?? "")
            Spacer()
        }
        .padding(.vertical)
    }
}

struct DetailPersonView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPersonView(event: Event.example, person: Person.example)
    }
}
