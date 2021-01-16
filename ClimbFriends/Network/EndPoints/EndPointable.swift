//
//  EndPoint.swift
//  ClimbFriends
//
//  Created by 박진수 on 2021/01/16.
//  Copyright © 2021 jinsu. All rights reserved.
//

import Foundation
import Alamofire

protocol EndPointable {
    var path: String { get }
    var headers: HTTPHeaders? { get }
    var httpMethod: HTTPMethod { get }
}

extension EndPointable {
    var baseUrl: String {
        return ""
    }
    
    var fullUrl: String {
        return baseUrl + path
    }
}
