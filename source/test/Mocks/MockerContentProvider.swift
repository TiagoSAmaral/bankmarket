//
//  MockerContentProvider.swift
//  hearthstonecardviewer
//
//  Created by Tiago Amaral on 20/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

public final class MockerContentProvider: KeyAdvisor {
    var publicKeyApi: String {
        // Provider value to test
        //        .empty
        "p1"
    }
    
    var privateKeyApi: String {
        // Provider value to test
        //        .empty
        "s2"
    }
    
    var mockSuccessCardListPage: MockNetworkPurveyor {
        
        let urlPath = URL(string: "https://us.api.blizzard.com/hearthstone/cards?page=1&locale=en_US")!
        let data = loadDataListItem()
        let headers = [
            Header.Keys.contentType.rawValue: Header.Values.applicationJson.rawValue,
            Header.Keys.authorization.rawValue: "Bearer XXXX"
        ]
        
        let requestCardsWithSuccess = MockResponse(statusCode: .code200,
                                                   httpVersion: .http1,
                                                   data: data,
                                                   headers: headers)
        
        let mocknetworkPurveyorCardList = MockNetworkPurveyor(urlRequest: try! URLRequest(url: urlPath, method: .get),
                                                              response: requestCardsWithSuccess)
        
        return mocknetworkPurveyorCardList
    }
    
    var mockFailureCardListPage: MockNetworkPurveyor {
        let urlPath = URL(string: "https://us.api.blizzard.com/hearthstone/cards?page=2&locale=en_US")!
        let headers = [
            Header.Keys.contentType.rawValue: Header.Values.applicationJson.rawValue
        ]
        let requestCardsWithSuccess = MockResponse(statusCode: .code400,
                                                   httpVersion: .http1,
                                                   data: nil,
                                                   headers: headers)
        let mocknetworkPurveyorCardList = MockNetworkPurveyor(urlRequest: try! URLRequest(url: urlPath, method: .get),
                                                              response: requestCardsWithSuccess)
        
        return mocknetworkPurveyorCardList
    }
    
    var mockSuccessMetadata: MockNetworkPurveyor {
        let urlPath = URL(string: "https://us.api.blizzard.com/hearthstone/metadata?locale=en_US")!
        let headers = [
            Header.Keys.contentType.rawValue: Header.Values.applicationJson.rawValue,
            Header.Keys.authorization.rawValue: "CONTENT VALID AUTH"
        ]
        
        let requestCardsWithSuccess = MockResponse(statusCode: .code200,
                                                   httpVersion: .http1,
                                                   data: nil,
                                                   headers: headers)
        
        let mocknetworkPurveyorCardList = MockNetworkPurveyor(urlRequest: try! URLRequest(url: urlPath, method: .get),
                                                              response: requestCardsWithSuccess)
        
        return mocknetworkPurveyorCardList
    }
    
    var mockFailureMetadata: MockNetworkPurveyor {
        let urlPath = URL(string: "https://us.api.blizzard.com/hearthstone/metadata?locale=en_US")!
        let headers = [
            Header.Keys.contentType.rawValue: Header.Values.applicationJson.rawValue
        ]
        let requestCardsWithSuccess = MockResponse(statusCode: .code400,
                                                   httpVersion: .http1,
                                                   data: nil,
                                                   headers: headers)
        let mocknetworkPurveyorCardList = MockNetworkPurveyor(urlRequest: try! URLRequest(url: urlPath, method: .get),
                                                              response: requestCardsWithSuccess)
        
        return mocknetworkPurveyorCardList
    }
    
    
    func listItem<T: Decodable>(type: T.Type) -> T? {
        loadMockFrom(fileName: "listItem")
    }
    
    func item<T: Decodable>(type: T.Type) -> T? {
        loadMockFrom(fileName: "item")
    }
    
    func metadata<T: Decodable>(type: T.Type) -> T? {
        loadMockFrom(fileName: "metadata")
    }
    
    func loadDataListItem() -> Data? {
        loadData(fileName: "listItem")
    }
    
    func loadDataMetadata() -> Data? {
        loadData(fileName: "metadata")
    }
    
    private func loadData(fileName: String) -> Data? {
        guard let filePath = Bundle(for: Self.self).url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: filePath) else {
            return nil
        }
        
        return data
    }
    
    private func loadMockFrom<T: Decodable>(fileName: String) -> T? {
        guard let filePath = Bundle(for: Self.self).url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: filePath) else {
            return nil
        }
        
        do {
            let content = try JSONDecoder().decode(T.self, from: data)
            return content
        } catch let error {
            debugPrint(error.localizedDescription)
            return nil
        }
    }
}


// Request list cards - GEt
// https://us.api.blizzard.com/hearthstone/cards?page=1&locale=en_US
// headers: [ Authorization: Bearer XXX]

// Request Metadata - GET
// https://us.api.blizzard.com/hearthstone/metadata?locale=en_US
// headers: [ Authorization: Bearer XXX]

// Request Token - POST (Multipart)
// https://oauth.battle.net/token
// headers: [Content-Type: multipart/form-data]
// Multipart: [
//      client_id: III,
//      client_secret: SSS,
//      grant_type: client_credentials
// ]


