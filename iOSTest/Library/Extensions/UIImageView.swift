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
        let data = try! Data(contentsOf: url)
        self.image = UIImage(data: data)
    }

}
