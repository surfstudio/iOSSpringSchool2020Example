//
//  UIImageView.swift
//  iOSTest
//
//  Created by Mikhail Monakov on 22.04.2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import UIKit

extension UIImageView {

    func loadImage(by imageURL: String) {
        let url = URL(string: imageURL)!

        let cache = URLCache.shared
        let request = URLRequest(url: url)

        if let imageData = cache.cachedResponse(for: request)?.data {
            self.image = UIImage(data: imageData)
        } else {
            URLSession.shared.dataTask(with: request) { (data, response, _) in
                DispatchQueue.main.async {
                    guard let data = data, let response = response else {
                        return
                    }
                    let cacheRepsonse = CachedURLResponse(response: response, data: data)
                    cache.storeCachedResponse(cacheRepsonse, for: request)
                    self.image = UIImage(data: data)
                }
                
            }.resume()
        }

    }

}
