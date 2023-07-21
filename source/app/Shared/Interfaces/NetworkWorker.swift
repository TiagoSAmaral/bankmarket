//
//  NetworkWorker.swift
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol NetworkWorker {
    func request<T: Decodable>(with data: ApiParams, resultType: T.Type, handler: ResponseHandler<T>?) where T: Decodable
    func requestMultipart<T>(with data: ApiParams, resultType: T.Type, handler: ResponseHandler<T>?) where T: Decodable
}
