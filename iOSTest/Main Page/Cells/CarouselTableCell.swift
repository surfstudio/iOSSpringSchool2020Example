//
//  CarouselTableCell.swift
//  iOSTest
//
//  Created by Александр Филимонов on 20/04/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import UIKit

class CarouselTableCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none

        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionImageCell", bundle: nil), forCellWithReuseIdentifier: "collectionImageCell")
    }
    
}

extension CarouselTableCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionImageCell", for: indexPath)
        return cell
    }

}
