//
//  DataProvider.swift
//  iOSTest
//
//  Created by Mikhail Monakov on 27.04.2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import CoreData

final class DataProvider {

    private let context = CoreDataStack.shared.context
    private let service = BaseService()

    func loadCache(onComplete: @escaping ([PhotoModel]) -> Void) {
        let request: NSFetchRequest<PhotoEntity> = PhotoEntity.fetchRequest()
        request.fetchLimit = 5

        let photoEntities = try? self.context.fetch(request)

        if let photos = photoEntities, !photos.isEmpty {
            let photoModels = photos.map {
                PhotoModel(id: $0.id ?? "", description: $0.desc, urls: .init(regular: $0.url ?? "", small: ""))
            }
            onComplete(photoModels)
        } else {

        }
    }

    func loadPhotos(onComplete: @escaping ([PhotoModel]) -> Void, onError: @escaping (Error) -> Void) {
        service.loadPhotos(onComplete: { [weak self] (photos) in
            guard let self = self else { return }

            for item in photos {
                let photoEntity = PhotoEntity(context: self.context)
                photoEntity.id = item.id
                photoEntity.desc = item.description
                photoEntity.url = item.urls.regular
            }

            try? self.context.save()

            onComplete(photos)
        }) { (error) in
            print(error.localizedDescription)


        }
    }

}
