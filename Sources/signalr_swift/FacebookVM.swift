//
//  File.swift
//  
//
//  Created by Berkay Paçal on 12/24/22.
//

import Foundation
import BetterSafariView

public class FacebookViewModel: ObservableObject {
    
    @Published public var webAuthServiceStatus: Bool = false
    
    
   
    
    public func LoginWithFacebook () -> WebAuthenticationSession {
        let url: URL = URL(string: "https://sdk-fb-web-iszq.vercel.app")!
        return WebAuthenticationSession(url: url, callbackURLScheme: "vfb") { (callbackURL, error) in
            self.getAccessCode(url: callbackURL) { isSuccess, value in
                print(callbackURL)
                if(isSuccess) {
                    print(value)
                }
            }
        }.prefersEphemeralWebBrowserSession(true)
    }
    
    
    public func getAccessCode(url: URL?, completion: @escaping (Bool, String?) -> Void) {
        guard url != nil else {
            completion(false, nil)
            return
        }
        guard let accessCode = URLComponents(string: (url!.absoluteString))?
            .queryItems?.first(where: { $0.name == "code" }) else {
            completion(false, nil)
            return
        }
        guard let value = accessCode.value else {
            completion(false, nil)
            return
        }
        completion(true, value)
  
    }
    
}
