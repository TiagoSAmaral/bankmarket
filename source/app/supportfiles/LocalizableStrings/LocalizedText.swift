//
//  LocalizedStringsStatic.swift
//  BaseProjectTarget
//
//  Created on 23/01/20.
//

import Foundation

struct LocalizedText {
    
    enum LocalizeTags: String {
            case networkErrorNotDefined // = "networkErrorNotDefined"
            case networkOffline // = "networkOffline"
            case serverNotResponse // = "serverNotResponse"
            case pullToRefreshText
        }
    
    static func with(tagName: LocalizeTags) -> String {
        return Bundle.main.localizedString(forKey: tagName.rawValue, value: nil, table: "Localizable-pt-BR")
    }
}
