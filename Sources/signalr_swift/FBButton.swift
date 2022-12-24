//
//  SwiftUIView.swift
//  
//
//  Created by Berkay Paçal on 12/24/22.
//

import SwiftUI

@available(iOS 15.0, *)
struct FacebookButton: View {
    
    @StateObject var facebookVM: FacebookViewModel = FacebookViewModel()
    
    var body: some View {
        Button("Login with Facebook") {
            facebookVM.webAuthServiceStatus = true
        }.padding(.all).background(.blue).foregroundColor(.white).cornerRadius(10).webAuthenticationSession(isPresented: $facebookVM.webAuthServiceStatus) {
            return facebookVM.LoginWithFacebook()
        }
    }
}

@available(iOS 15.0, *)
struct FacebookButton_Previews: PreviewProvider {
    static var previews: some View {
        FacebookButton()
    }
}