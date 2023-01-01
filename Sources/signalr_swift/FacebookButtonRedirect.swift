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

    public init() {
    }

    public var body: some View {
        Button("Login with Facebook Redirect") {
            openURL(URL(string: "https://sdk-fb-web-iszq.vercel.app")!)
        }.padding(.all).background(.blue).foregroundColor(.white).cornerRadius(10).onOpenURL { (url) in
            print("SDK result: \(url)")
        }
    }
}

@available(iOS 15.0, *)
struct FacebookButtonRedirect_Previews: PreviewProvider {
    static var previews: some View {
        FacebookButtonRedirect()
    }
}
