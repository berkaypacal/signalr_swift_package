//
//  messageItemView.swift
//  
//
//  Created by Berkay Paçal on 12/19/22.
//

import SwiftUI

@available(iOS 13.0, *)
struct MessageItemView: View {
    var contentMessage: String
    var isCurrentUser: Bool
    

    var body: some View {
        Text(contentMessage)
            .padding(10)
            .foregroundColor(isCurrentUser ? Color.white : Color.black)
            .background(isCurrentUser ? Color.blue : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
            .cornerRadius(10)
    }
}

@available(iOS 13.0, *)
struct SwiftUIView_2_Previews: PreviewProvider {
    static var previews: some View {
        
        MessageItemView(contentMessage: "deneme", isCurrentUser: true)
    }
}
