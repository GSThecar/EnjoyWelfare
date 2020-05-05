//
//  Service.swift
//  EnjoyWelfare
//
//  Created by 이덕화 on 2020/05/05.
//  Copyright © 2020 GSTheCar. All rights reserved.
//

import Foundation


class Service {
    static let sharedInstance: Service = {
        let instance = Service()
        return instance
    }()
    
   static func encodeToJsonData<T>(value: T) -> Data? where T : Encodable {
        let encoder = JSONEncoder()
        do {
            let data = try? encoder.encode(value)
            return data
        }
    }
    
   static func decodeTo<T>(type: T.Type, data: Data) -> T? where T : Decodable {
        let decoder = JSONDecoder()
        do {
            let valueTypeInstance = try? decoder.decode(type, from: data)
            return valueTypeInstance
        }
    }
}
