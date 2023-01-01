//
//  SwiftUIView.swift
//
//
//  Created by Berkay Paçal on 12/24/22.
//

import SwiftUI

@available(iOS 15.0, *)
public struct FacebookButtonRedirect: View {
    @Environment(\.openURL) var openURL

    @StateObject public var facebookVM: FacebookViewModel = FacebookViewModel()
    public let redirect: String

    public init(redirect: String) {
        self.redirect = redirect
    }

    public var body: some View {
        Button("Login with Facebook Redirect") {
            openURL(URL(string: "https://sdk-fb-web-iszq.vercel.app/?redirect=\(redirect)")!)
        }.padding(.all).background(.blue).foregroundColor(.white).cornerRadius(10).onOpenURL { (url) in
            facebookVM.getAccessCode(url: url) { isSuccess, value in
                print(url)
                if(isSuccess) {
                print(value)
                }
            }
        }
    }
}

@available(iOS 15.0, *)
struct FacebookButtonRedirect_Previews: PreviewProvider {
    static var previews: some View {
        FacebookButtonRedirect(redirect: "payt")
    }
}
