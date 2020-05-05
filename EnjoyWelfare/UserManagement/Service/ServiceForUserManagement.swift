//
//  ServiceForUserManagement.swift
//  EnjoyWelfare
//
//  Created by 이덕화 on 2020/05/05.
//  Copyright © 2020 GSTheCar. All rights reserved.
//

import Foundation

final class ServiceForUserManagement: Service {
    
    static func signUpMember(with socialId: String, email: String? = nil) {
        guard let url = URL(string: HoxyMeTooAPI.members.rawValue) else {
            print("Invalid URL: \(HoxyMeTooAPI.members.rawValue)")
            return
        }
        guard let encodedUserData = encodeToJsonData(value: NewUser(socialId: socialId, email: email)) else {
            print("Invalid EncodedData")
            return
        }
        
        var signUpRequest = URLRequest(url: url)
        signUpRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        signUpRequest.addValue("Accept", forHTTPHeaderField: "Vary")
        signUpRequest.httpMethod = "POST"
        signUpRequest.httpBody = encodedUserData
        
        let session = URLSession.shared
        let task = session.dataTask(with: signUpRequest) { (data, urlResponse, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                print("Invalid Response")
                return
            }
            switch httpResponse.statusCode {
            // Success
            case 200...299:
                guard let _ = data else {
                    print("Invalid Data")
                    return
                }
                // Overlap
                //            case 400:
                
            default:
                print("httpResponseStatusCode:\(httpResponse.statusCode)")
                return
            }
        }
        task.resume()
        
    }
    
}
