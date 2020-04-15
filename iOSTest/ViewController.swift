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
        
    }

    @IBAction func detailAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController")
        detailViewController.modalPresentationStyle = .overFullScreen
        present(detailViewController, animated: true, completion: nil)
    }

}
