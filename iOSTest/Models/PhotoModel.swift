//
//  PhotoModel.swift
//  iOSTest
//
//  Created by Mikhail Monakov on 22.04.2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import Foundation

struct PhotoModel: Codable {
    let id: String
    let description: String?
    let urls: UrlsModel
}

struct UrlsModel: Codable {
    let regular: String
    let small: String
}
