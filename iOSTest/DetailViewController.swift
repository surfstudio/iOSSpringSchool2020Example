//
//  DetailViewController.swift
//  iOSTest
//
//  Created by Dmitry Yordanov on 15.04.2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }

    private func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "close"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(closeTapped))
    }

    @objc
    func closeTapped() {
        dismiss(animated: true, completion: nil)
    }

}
