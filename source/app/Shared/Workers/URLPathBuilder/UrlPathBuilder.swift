//
//  UrlPathBuilder.swift
//  HeartOfStoneViewerTarget
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

import Foundation

class URLPathBuilder: WorkerURLPathBuilder {
    private var contentBaseUrl: URLComponents?
    private var authorizationBaseUrl: URLComponents?
    
    private let contentBaseUrlKey: String = "CONTENT_BASE_URL"
    private let authBaseUrlKey: String = "AUTH_BASE_URL"
    private let contentHeartOfStoneCards: String = "/hearthstone/cards"
    private let contentHeartOfStoneMetadata: String = "/hearthstone/metadata"
    private let authPathToken: String = "/token"
    
    init() {
        makeContentBaseUrl()
        makeAuthorizationBaseURL()
    }

    func makeContentBaseUrl() {
        guard let baseUrl = Bundle.main.object(forInfoDictionaryKey: contentBaseUrlKey) as? String else {
            return
        }
        contentBaseUrl = URLComponents(string: baseUrl)
    }
    
    func makeAuthorizationBaseURL() {
        guard let authBaseUrl = Bundle.main.object(forInfoDictionaryKey: authBaseUrlKey) as? String else {
            return
        }
        authorizationBaseUrl = URLComponents(string: authBaseUrl)
        authorizationBaseUrl?.path = authPathToken
    }
    
    func makeUrlCards(with page: Int, locale: String) -> URL? {
        contentBaseUrl?.path = contentHeartOfStoneCards
        contentBaseUrl?.queryItems = []
        contentBaseUrl?.queryItems?.append(contentsOf: [
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "locale", value: locale)
        ])
        
        let finalProduct = contentBaseUrl?.url
        makeContentBaseUrl()
        return finalProduct
    }
    
    func makeUrlMetadata(with locale: String) -> URL? {
        contentBaseUrl?.path = contentHeartOfStoneMetadata
        contentBaseUrl?.queryItems = []
        contentBaseUrl?.queryItems?.append(contentsOf: [
            URLQueryItem(name: "locale", value: locale)
        ])
        
        let finalProduct = contentBaseUrl?.url
        makeContentBaseUrl()
        return finalProduct
    }
    
    func makeUrlAuthorization() -> URL? {
        authorizationBaseUrl?.url
    }
}
