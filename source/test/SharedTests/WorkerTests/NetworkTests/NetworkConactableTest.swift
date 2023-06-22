//
//  File.swift
//  HeartOfStoneViewerTests
//
//  Created by Tiago Amaral on 22/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import XCTest

final class NetworkConactableTests: XCTestCase {
    
    var sut: NetworkWorker?
    
    override func setUp() {
        sut = NetworkConactable(afSession: URLProtocolMock.makeSession())
    }
    
    func testRequestCardsSuccess() {
        let urlPathBuilder = URLPathBuilder()
        let urlPath = urlPathBuilder.makeUrlCards(with: 1, locale: "en_US")!
        let params = ApiParams(urlPath: urlPath, token: "XXXX", method: .get, params: nil)
        
        let expectation = expectation(description: "RequestlistCards")
        
        
        sut?.request(with: params, resultType: ResponseList.self, handler: { response in
            
            switch response {
            case .success(let list):
                XCTAssertNotNil(list.cards)
                XCTAssertEqual(list.cards?.first?.identifier, 38913)
            case .failure(let error):
                XCTFail(error.message)
            }
            
            expectation.fulfill()
        })
        
        wait(for: [expectation])
    }
    
    func testRequestCardsFailure() {
        let urlPathBuilder = URLPathBuilder()
        let urlPath = urlPathBuilder.makeUrlCards(with: 1, locale: "en_US")!
        let params = ApiParams(urlPath: urlPath, token: .empty, method: .get, params: nil)
        
        let expectation = expectation(description: "RequestlistCards")
        
        
        sut?.request(with: params, resultType: ResponseList.self, handler: { response in
            
            switch response {
            case .success(let list):
                XCTFail("Expected error by Token wrong")
            case .failure(let error):
//                XCTFail(error.message)
                XCTAssertEqual(error.message, "Something is wrong, please try again. In case this error persist, contact the support.")
            }
            
            expectation.fulfill()
        })
        
        wait(for: [expectation])
    }
    
    func testReuqestTokenSuccess() {
        let urlPathBuilder = URLPathBuilder()
        let urlPath = urlPathBuilder.makeUrlAuthorization()!
        let params = ApiParams(urlPath: urlPath, token: .empty, method: .post, params: nil)
        
        let expectation = expectation(description: "RequestlistCards")
        
        
        sut?.request(with: params, resultType:  ResponseAuthorizationBearer.self, handler: { response in
            
            switch response {
            case .success(let token):
                XCTAssertEqual(token.accessToken, "fakeHashToken45612345")
            case .failure(let error):
                XCTFail(error.message)
            }
            
            expectation.fulfill()
        })
        
        wait(for: [expectation])
        
    }
}
