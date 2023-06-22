//
//  UrlPathBuilder.swift
//  HeartOfStoneViewerTarget
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

class URLPathBuilder: WorkerURLPathBuilder {
    private var contentBaseUrl: URLComponents?
    private var authorizationBaseUrl: URLComponents?
    
    private let contentBaseUrlString: String = "https://us.api.blizzard.com"
    private let authBaseUrlString: String = "https://oauth.battle.net"
    private let contentHeartOfStoneCards: String = "/hearthstone/cards"
    private let contentHeartOfStoneMetadata: String = "/hearthstone/metadata"
    private let authPathToken: String = "/token"
    
    init() {
        makeContentBaseUrl()
        makeAuthorizationBaseURL()
    }

    func makeContentBaseUrl() {
        contentBaseUrl = URLComponents(string: contentBaseUrlString)
    }
    
    func makeAuthorizationBaseURL() {
        authorizationBaseUrl = URLComponents(string: authBaseUrlString)
        authorizationBaseUrl?.path = authPathToken
    }
    
    func makeUrlCards(with page: Int, locale: String) -> URL? {
        contentBaseUrl?.path = contentHeartOfStoneCards
        contentBaseUrl?.queryItems = []
        contentBaseUrl?.queryItems?.append(contentsOf: [
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "locale", value: locale),
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
