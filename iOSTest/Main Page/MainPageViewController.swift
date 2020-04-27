//
//  MainPageViewController.swift
//  iOSTest
//
//  Created by Александр Филимонов on 20/04/2020.
//  Copyright © 2020 Surf. All rights reserved.
//
import UIKit

class MainPageViewController: UIViewController {

    // MARK: - Constants

    private enum Constants {
        static let defaultCount = 4
    }

    @IBOutlet weak var tableView: UITableView!

    var photos = [PhotoModel]()
    let service = DataProvider()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ImageTableCell", bundle: nil),
                           forCellReuseIdentifier: "imageCell")
        tableView.register(UINib(nibName: "TitleTableCell", bundle: nil),
                           forCellReuseIdentifier: "titleCell")
        tableView.register(UINib(nibName: "CarouselTableCell", bundle: nil),
                           forCellReuseIdentifier: "carouselCell")
        tableView.register(UINib(nibName: "MainPageHeaderTableCell", bundle: nil),
                           forCellReuseIdentifier: "headerCell")
        tableView.separatorStyle = .none
        tableView.contentInsetAdjustmentBehavior = .never

        loadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func loadData() {
        service.loadPhotos(onComplete: { [weak self] (photos) in
            self?.photos = photos
            print("photos count", photos.count)
            self?.tableView.reloadData()
            // save to data base
        }) { (error) in
            // fetch from database
            print(error.localizedDescription)
        }
    }

}

extension MainPageViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count + Constants.defaultCount
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! TitleTableCell
            cell.titleLabel.text = "Explore"
            return cell
        } else if indexPath.row == 2 {
            // каруселька
            let cell = tableView.dequeueReusableCell(withIdentifier: "carouselCell", for: indexPath)
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! TitleTableCell
            cell.titleLabel.text = "New"
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as? ImageTableCell else {
                return UITableViewCell()
            }
            let model = photos[indexPath.row - Constants.defaultCount]
            cell.customImageView.loadImage(by: model.urls.regular)
            cell.textLabel?.text = model.description
            return cell
        }
    }

}
