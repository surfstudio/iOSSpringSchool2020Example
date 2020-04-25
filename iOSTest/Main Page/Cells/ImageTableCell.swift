//
//  ImageTableCell.swift
//  iOSTest
//
//  Created by Александр Филимонов on 20/04/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import UIKit

class ImageTableCell: UITableViewCell {

    @IBOutlet weak var customImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none

//        customImageView.image = UIImage(named: "customImage")
//        customImageView.contentMode = .center
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        customImageView.alpha = highlighted ? 0.5 : 1
    }
    
}
