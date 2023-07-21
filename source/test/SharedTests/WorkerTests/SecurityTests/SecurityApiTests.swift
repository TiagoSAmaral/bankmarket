//
//  KeychainAccessTests.swift
//  bankmarketTests
//
//  Created by Tiago Amaral on 21/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import XCTest

final class SecurityApiTests: XCTestCase {
    
    var sut: Security?
    let keyValueTest: String = "keyTokenAccess"
    
    override func setUp() {
        KeyChainFake.resetStatesInvoked()
        sut = Security(keychainAccess: KeyChainFake())
    }
    
    func testInit() {
        XCTAssertNotNil(sut?.keychainAccess)
    }
    
    func testTakeLocal() {
        let testValue = "456s78"
        try! KeyChainFake.main.addNew(secretWord: testValue, keyValue: keyValueTest)
        
        guard let valueFound = sut?.requestLocalToken() else {
            XCTFail("Expect find a valid token")
            return
        }
        
        XCTAssertEqual(valueFound, testValue)
    }
    
    func testRemoveLocal() {
        let testValue = "456s78"
        try! KeyChainFake.main.addNew(secretWord: testValue, keyValue: keyValueTest)
        
        sut?.deleteToken()

        XCTAssertTrue(KeyChainFake.isRemoveInvoked)
        XCTAssertNil(KeyChainFake.token[keyValueTest])
    }
    
    func testGetTokenCached() {
        let fakeValueToken = "localValueCachedTOKEN"
        KeyChainFake.token = [keyValueTest: fakeValueToken]
        
        let expectation = expectation(description: "Get cached token")
        
        sut?.getUserToken(handler: { result in
            
            switch result {
            case .success(let token):
                XCTAssertEqual(token, fakeValueToken)
            case .failure(let error):
                XCTFail(error.message)
            }
            
            expectation.fulfill()
        })
        
        wait(for: [expectation],timeout: 2)
    }
    
    func testGetFailKeyAdvisorNil() {
        let expectation = expectation(description: "Get cached token")
        
        sut?.getUserToken(handler: { result in
            
            switch result {
            case .success(let token):
//                XCTAssertEqual(token, fakeValueToken)
                XCTFail("Must fail by keyadvidor nil")
            case .failure(let error):
                XCTAssertNotNil(error.message)
            }
            
            expectation.fulfill()
        })
        
        wait(for: [expectation],timeout: 2)
    }
    
    func testGetFailUrlBuilderNil() {
        let expectation = expectation(description: "Get cached token")
        
        sut?.keyAdvisor = KeysAcessor()
        
        sut?.getUserToken(handler: { result in
            
            switch result {
            case .success(_):
                XCTFail("Must fail by keyadvidor nil")
            case .failure(let error):
                XCTAssertNotNil(error.message)
            }
            expectation.fulfill()
        })
        
        wait(for: [expectation],timeout: 2)
    }
}


final class KeyChainFake: KeyChainAccessor {
    
    static let main: KeyChainFake = KeyChainFake()
    
    static var isAddNewInvoked: Bool = false
    static var isReNewInvoked: Bool = false
    static var isTakeInvoked: Bool = false
    static var isRemoveInvoked: Bool = false
    static var token: [String: String] = [:]
    
    static func resetStatesInvoked() {
        KeyChainFake.isAddNewInvoked = false
        KeyChainFake.isReNewInvoked = false
        KeyChainFake.isTakeInvoked = false
        KeyChainFake.isRemoveInvoked = false
        KeyChainFake.token = [:]
    }
    
    func addNew(secretWord: String, keyValue: String) throws {
        
        KeyChainFake.isAddNewInvoked = true
        
        if secretWord == .empty {
            throw FakeError.secretEmpty
        }
        
        if keyValue == .empty {
            throw FakeError.keyEmpty
        }
        
        KeyChainFake.token[keyValue] = secretWord
    }
    
    func renew(secretWord: String, keyValue: String) throws {
        
        KeyChainFake.isReNewInvoked = true
        
        if secretWord == .empty {
            throw FakeError.secretEmpty
        }
        
        if keyValue == .empty {
            throw FakeError.keyEmpty
        }
        
        KeyChainFake.token[keyValue] = secretWord
    }
    
    func take(keyValue: String) throws -> String? {
        
        KeyChainFake.isTakeInvoked = true
        
        if keyValue == .empty {
            throw FakeError.keyEmpty
        }
        
        return KeyChainFake.token[keyValue]
    }
    
    func remove(keyValue: String) throws {
        
        KeyChainFake.isRemoveInvoked = true
        
        if keyValue == .empty {
            throw FakeError.keyEmpty
        }
        
        KeyChainFake.token.removeValue(forKey: keyValue)
    }
    
    enum FakeError: String, Error {
        case secretEmpty = "secret empty."
        case keyEmpty = "key empty"
    }
}
