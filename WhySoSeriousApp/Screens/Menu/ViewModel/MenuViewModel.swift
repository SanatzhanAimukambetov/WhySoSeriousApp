//
//  MenuViewModel.swift
//  WhySoSeriousApp
//
//  Created by Sanatzhan Aimukambetov on 15.12.2020.
//

import Foundation

class MenuViewModel {
    
    private var jokes = [Joke]()
    private let imageHelper = ImageDownloaderService()
    
    func getJokes() -> [Joke] {
        return jokes
    }
    
    func createJokeViewModel() -> (JokeViewModel) {
        let jokesViewModel = JokeViewModel(jokes: jokes)
        jokesViewModel.saveJokes = { jokes in
            guard let jokes = jokes else { return }
            self.jokes = jokes
        }
        return jokesViewModel
    }
    
    func imageDownload(completion: @escaping (Data?) -> ()) {
        imageHelper.downloadData() { (result) in
            switch result {
            case .success(let data):
                completion(data)
            case .failure:
                completion(nil)
            }
        }
    }
}
