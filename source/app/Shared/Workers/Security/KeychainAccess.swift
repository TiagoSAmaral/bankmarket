//
//  KeychainAccess.swift
//  HeartOfStoneViewerTarget
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation
import Security

protocol KeyChainAccessor {
    func addNew(secretWord: String, keyValue: String) throws
    func renew(secretWord: String, keyValue: String) throws
    func take(keyValue: String) throws -> String?
    func remove(keyValue: String) throws
}

class KeychainAccess: NSObject, KeyChainAccessor {
    
    func addNew(secretWord: String, keyValue: String) throws {
        
        let dataValue = Data(secretWord.utf8)
        
        let query = [
            kSecAttrService as String: Bundle.main.bundleIdentifier as AnyObject,
            kSecAttrAccount as String: keyValue as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            kSecValueData as String: dataValue as AnyObject,
        ]  as CFDictionary
        
        let result = SecItemAdd(query, nil)
        
        if result == errSecDuplicateItem {
            throw KeychainAPIResult.alreadyExists
        }
        
        guard result == errSecSuccess else {
            throw KeychainAPIResult.notDefined(result)
        }
    }
    
    func renew(secretWord: String, keyValue: String) throws {
        
        let dataValue = Data(secretWord.utf8)
        
        let query = [
            kSecAttrService as String: Bundle.main.bundleIdentifier as AnyObject,
            kSecAttrAccount as String: keyValue as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
        ] as CFDictionary
        
        let newValue = [
            kSecValueData as String: dataValue as AnyObject
        ] as CFDictionary
        
        let result = SecItemUpdate(query, newValue)
        
        guard result != errSecDuplicateItem else {
            throw KeychainAPIResult.notFound
        }
        
        guard result == errSecSuccess else {
            throw KeychainAPIResult.notDefined(result)
        }
    }
    
    func take(keyValue: String) throws -> String? {
        let query = [
            kSecAttrService as String: Bundle.main.bundleIdentifier as AnyObject,
            kSecAttrAccount as String: keyValue as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: kCFBooleanTrue ?? "true",
        ] as CFDictionary
        
        var shadowValue: AnyObject?
        let result = SecItemCopyMatching(query, &shadowValue)
        
        guard result != errSecItemNotFound else {
            throw KeychainAPIResult.notFound
        }
        
        guard result == errSecSuccess else {
            throw KeychainAPIResult.notDefined(result)
        }
        
        guard let secretWord = shadowValue as? Data else {
            throw KeychainAPIResult.invalid
        }
        
        return String(data: secretWord, encoding: .utf8)
    }
    
    func remove(keyValue: String) throws {
        
        let query = [
            kSecAttrService as String: Bundle.main.bundleIdentifier as AnyObject,
            kSecAttrAccount as String: keyValue as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
        ] as CFDictionary
        
        let result = SecItemDelete(query)
        
        guard result == errSecSuccess else {
            throw KeychainAPIResult.notDefined(result)
        }
    }
    
    enum KeychainAPIResult: Error {
        case invalid
        case notFound
        case alreadyExists
        case notDefined(OSStatus?)
    }
}
