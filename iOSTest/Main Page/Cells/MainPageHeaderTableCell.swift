//
//  MainPageHeaderTableCell.swift
//  iOSTest
//
//  Created by Александр Филимонов on 20/04/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import UIKit

class MainPageHeaderTableCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureHeaderImage()
        configureLabels()
        selectionStyle = .none
    }

    // MARK: - Configuration

    func configureHeaderImage() {
        headerImageView.contentMode = .scaleAspectFill
        headerImageView.image = UIImage(named: "customImage")
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    }

    func configureLabels() {
        titleLabel.font = UIFont.systemFont(ofSize: 32.0, weight: .semibold)
        titleLabel.textColor = UIColor.white
        titleLabel.numberOfLines = 3
        titleLabel.textAlignment = .center
        titleLabel.text = "Photos for everyone"

        authorLabel.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        authorLabel.textColor = UIColor(red: 189.0/255.0, green: 189.0/255.0, blue: 189.0/255.0, alpha: 1)
        authorLabel.numberOfLines = 1
        authorLabel.textAlignment = .center
        authorLabel.text = "Photo by Marcelo Cidrack"
    }

}
