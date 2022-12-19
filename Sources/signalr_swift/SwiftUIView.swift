//
//  SwiftUIView.swift
//  
//
//  Created by Berkay Paçal on 12/19/22.
//

import SwiftUI

@available(iOS 14.0, *)
public struct ChatView: View {
    @StateObject public var chatVM: SignalRService = SignalRService()
    @State public var typingMessage: String = ""
    
 

  
  public var body: some View {
      VStack {
         List {
             ForEach(chatVM.messageList, id: \.self) { msg in
                 HStack {
                     if(msg.connectionID == chatVM.connection.connectionId){
                         Spacer()
                         MessageItemView(contentMessage: msg.message, isCurrentUser: true).frame(alignment: .trailing)
                     }else{
                         MessageItemView(contentMessage: msg.message, isCurrentUser: false)
                     }
                 }
                
                
              }
         }.listStyle(.plain)
         HStack {
             TextField("Message", text: $typingMessage)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(minHeight: CGFloat(30))
             Button("Send") {
                 chatVM.sendMessage(message: typingMessage)
                 typingMessage = ""
                 
             }
          }.frame(minHeight: CGFloat(50)).padding()
      }
  }
}



@available(iOS 14.0, *)
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
