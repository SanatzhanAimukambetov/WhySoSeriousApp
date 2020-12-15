//
//  ImageDownloaderService.swift
//  WhySoSeriousApp
//
//  Created by Sanatzhan Aimukambetov on 15.12.2020.
//

import Foundation

class ImageDownloaderService {
    
    private let arrayOfURLs =       ["https://www.indiewire.com/wp-content/uploads/2019/08/joker-phoenix-1135161-1280x0.jpeg",
                               "https://cnet2.cbsistatic.com/img/_lNMrF9YtRQEtAPwSwiRCrxeyTo=/1200x630/2018/07/16/87518406-dde9-41e5-b99b-8ae54755b4c6/jokers-heathledger-1.jpg",
                               "https://www.denofgeek.com/wp-content/uploads/2019/04/gotham-season-5-the-joker.jpg?fit=1724%2C976",
                               "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2019%2F07%2Fjoker_yotv_1_cvr_col_final-2000.jpg&q=85",
                               "https://fastly.syfy.com/sites/syfy/files/styles/1200x680/public/2017/08/the-joker-origins-hero.jpg?offset-x=100&offset-y=0",
                                "https://comicvine1.cbsistatic.com/uploads/scale_small/12/124259/7538232-three-jokers-1-cvr-fnl-1583776056592.jpg"]
    
    func downloadData(completion: @escaping (Result<Data, NetworkError>) -> ()) {
        guard let urlString = arrayOfURLs.randomElement(), let urlImage = URL(string: urlString) else {
            completion(.failure(.URLError))
            return
        }
        URLSession.shared.dataTask(with: urlImage) { (data, _, error) in
            if error != nil {
                completion(.failure(.internetError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.dataError))
                return
            }
            completion(.success(data))
        }.resume()
    }
    
}
