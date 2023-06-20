//
//  LocalizedStringsStatic.swift
//  BaseProjectTarget
//
//  Created on 23/01/20.
//

import Foundation

struct LocalizedText {
    
    enum LocalizeTags: String {
            case networkErrorNotDefined
            case networkOffline
            case serverNotResponse
            case pullToRefreshText
            case tokenIsRequired
            case prBrLocalization
            case nameText
            case setText
            case rarityText
            case atackText
            case costText
            case healthText
        }
    
    static func with(tagName: LocalizeTags) -> String {
        return Bundle.main.localizedString(forKey: tagName.rawValue, value: nil, table: "Localizable-pt-BR")
    }
}
