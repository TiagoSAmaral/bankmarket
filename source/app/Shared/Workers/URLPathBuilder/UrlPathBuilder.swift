//
//  UrlPathBuilder.swift
//  bankmarketTarget
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

class URLPathBuilder: WorkerURLPathBuilder {

    private(set) var contentBaseUrl: URLComponents?
    private(set) var authorizationBaseUrl: URLComponents?
    let contentBaseUrlString: String = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products"

    init() {
        makeContentBaseUrl()
    }

    func makeContentBaseUrl() {
        contentBaseUrl = URLComponents(string: contentBaseUrlString)
    }

    // MARK: - WorkerURLPathBuilder
    func makeMainListUrl() -> URL? {
        contentBaseUrl?.url
    }
}
