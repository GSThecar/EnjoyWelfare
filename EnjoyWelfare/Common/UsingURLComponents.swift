//
//  UsingURLComponents.swift
//  EnjoyWelfare
//
//  Created by 이덕화 on 2020/05/05.
//  Copyright © 2020 GSTheCar. All rights reserved.
//

import Foundation

protocol UsingURLComponents {
    func urlComponents(with string: String, relativeTo: URL, queryItems: [String:String]?) -> URLComponents
}
