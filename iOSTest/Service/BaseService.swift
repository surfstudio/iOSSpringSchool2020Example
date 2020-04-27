//
//  BaseService.swift
//  iOSTest
//
//  Created by Mikhail Monakov on 22.04.2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import Foundation

enum ServerError: Error {
    case noDataProvided
    case failedToDecode
}

class BaseService {

    func loadPhotos(onComplete: @escaping ([PhotoModel]) -> Void, onError: @escaping (Error) -> Void) {

        let urlString = NetworkConstants.baseURL + "/photos/random?count=10&client_id=" + NetworkConstants.accessKey

        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                onError(error)
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    onError(ServerError.noDataProvided)
                }
                return
            }

            guard let photos = try? JSONDecoder().decode([PhotoModel].self, from: data) else {
                print("could not decode")
                DispatchQueue.main.async {
                    onError(ServerError.failedToDecode)
                }
                return
            }
            DispatchQueue.main.async {
                onComplete(photos)
            }
        }
        task.resume()
    }

}
