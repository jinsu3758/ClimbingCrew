//
//  ApiService.swift
//  ClimbFriends
//
//  Created by 박진수 on 2021/01/16.
//  Copyright © 2021 jinsu. All rights reserved.
//

import Foundation
import Alamofire

protocol ApiServiceType {
    func fetch<T: Decodable, U: Encodable>(to endPoint: EndPointable,
                                           parameters: U?,
                                           completion: ((Result<T?, Error>) -> Void)?)
}

class ApiService: ApiServiceType {
    func fetch<T, U>(to endPoint: EndPointable,
                     parameters: U?,
                     completion: ((Result<T?, Error>) -> Void)?)
    where T : Decodable, U : Encodable {
        AF.request(endPoint.fullUrl, method: endPoint.httpMethod, parameters: parameters, encoder: URLEncodedFormParameterEncoder.default, headers: endPoint.headers)
            .responseDecodable(of: T.self) { response in
                
                switch response.result {
                case .success(let result):
                    completion?(.success(result))
                case .failure(let error):
                    completion?(.failure(error))
                }
            }
    }
}
