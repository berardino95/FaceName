//
//  ListRowView.swift
//  FaceName
//
//  Created by Berardino Chiarello on 11/07/23.
//

import SwiftUI

struct ListRowView: View {
    
    var event : Event
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(event.name)
                .font(.title2.bold())
            Text(event.date, style: .date)
                .font(.caption)
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(event: Event.example)
    }
}
