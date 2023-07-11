//
//  AvatarView.swift
//  FaceName
//
//  Created by Berardino Chiarello on 10/07/23.
//

import SwiftUI

struct AvatarView: View {
    
    var avatarImage : UIImage?
    
    var body: some View {
        if let avatarImage {
            Image(uiImage: avatarImage)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
        } else {
            ZStack{
                Circle()
                    .foregroundColor(.mint)
                Image (systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .padding(20)
                    .foregroundColor(.white)
                    .background(.mint)
                    .clipShape(Circle())
            }
            
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
