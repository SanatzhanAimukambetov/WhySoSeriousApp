//
//  JokeViewModel.swift
//  WhySoSeriousApp
//
//  Created by Sanatzhan Aimukambetov on 14.12.2020.
//

import Foundation

class JokeViewModel {
    
    private var apiService = ApiService()
    private var tenJokes = [Joke]()
    
    func fetchJokesData(completion: @escaping () -> ()) {
        
        // weak self - prevent retain cycles
        apiService.getJokeData{ [weak self] (result) in
            
            switch result {
            case .success(let listOf):
                self?.tenJokes = listOf
                completion()
            case .failure(let error):
                // Something is wrong with the JSON file or the model
                print("Error processing json data: \(error)")
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if tenJokes.count != 0 {
            return tenJokes.count
        }
        return 0
    }
    
    func cellForRowAt (indexPath: IndexPath) -> Joke {
        return tenJokes[indexPath.row]
    }
}
