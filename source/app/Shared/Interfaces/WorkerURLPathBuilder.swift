//
//  URLPathBuildable.swift
//  HeartOfStoneViewerTarget
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol WorkerURLPathBuilder {
    func makeUrlCards(with page: Int, locale: String) -> URL?
    func makeUrlMetadata(with locale: String) -> URL?
    func makeUrlAuthorization() -> URL?
}
