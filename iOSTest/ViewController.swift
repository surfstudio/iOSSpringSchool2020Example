//
//  ViewController.swift
//  iOSTest
//
//  Created by Vladislav Krupenko on 08.04.2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let helloTest = Hello()
        helloTest.sayHello("Vlad")
    }

}