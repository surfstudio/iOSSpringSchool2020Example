//
//  TitleTableCell.swift
//  iOSTest
//
//  Created by Александр Филимонов on 20/04/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import UIKit

class TitleTableCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none

        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
    }
    
}
