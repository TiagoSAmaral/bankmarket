//
//  MockerContentProvider.swift
//  bankmarket
//
//  Created by Tiago Amaral on 20/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

public final class MockerContentProvider {
    var mockSuccessCardListPage: MockNetworkPurveyor {
        
        let urlPath = URL(string: "https://baseurl.com/items?page=1&locale=en_US")!
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
        let urlPath = URL(string: "https://baseurl.com/items?page=2&locale=en_US")!
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
        let urlPath = URL(string: "https://baseurl.com/metadata?locale=en_US")!
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
        let urlPath = URL(string: "https://baseurl.com/metadata?locale=en_US")!
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
    
    var mockSuccessToken: MockNetworkPurveyor {
        let urlPath = URL(string: "https://oauth.baseurl.com/token")!
        let data = token()
        
        let requestCardsWithSuccess = MockResponse(statusCode: .code200,
                                                   httpVersion: .http1,
                                                   data: data,
                                                   headers: [:])
        
        let mocknetworkPurveyorCardList = MockNetworkPurveyor(urlRequest: try! URLRequest(url: urlPath, method: .post),
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
    
    func token() -> Data? {
        loadData(fileName: "responseToken")
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
