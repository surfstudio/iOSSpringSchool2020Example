//
//  CollectionImageCell.swift
//  iOSTest
//
//  Created by Александр Филимонов on 20/04/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import UIKit

class CollectionImageCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        imageView.image = UIImage(named: "customImage")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
    }

}
