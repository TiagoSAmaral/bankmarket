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
    
    func listItem<T: Decodable>(type: T.Type) -> T? {
        loadMockFrom(fileName: "listItem")
    }
    
    func item<T: Decodable>(type: T.Type) -> T? {
        loadMockFrom(fileName: "item")
    }
    
    func metadata<T: Decodable>(type: T.Type) -> T? {
        loadMockFrom(fileName: "metadata")
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
