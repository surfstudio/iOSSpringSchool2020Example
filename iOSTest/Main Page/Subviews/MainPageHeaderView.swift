//
//  MainPageHeaderView.swift
//  iOSTest
//
//  Created by Александр Филимонов on 20/04/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import UIKit

class MainPageHeaderView: UIView {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photos for everyone"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = .white
        return label
    }()
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photo by Marcelo Cidrack"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.gray.withAlphaComponent(0.7)
        return label
    }()
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "customImage"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConstraints()
    }

    func setupConstraints() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(imageView)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.rightAnchor.constraint(equalTo: rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
