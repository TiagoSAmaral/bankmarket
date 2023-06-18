//
//  NetworkWorker.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

struct ApiParams {
    let page: Int?
}

typealias Responsable<T: Decodable> = Result<T, NetworkError>
typealias ResponseHandler<T: Decodable> = ((Result<T, NetworkError>) -> Void)

final class NetworkConactable: NetworkWorker {
    func request<T>(with data: ApiParams, resultType: T.Type, handler: ResponseHandler<T>?) where T: Decodable {
        
    }
}
