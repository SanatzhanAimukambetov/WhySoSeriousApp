//
//  RandomJokeViewModel.swift
//  WhySoSeriousApp
//
//  Created by Sanatzhan Aimukambetov on 15.12.2020.
//

import Foundation

class RandomJokeViewModel {
    
    private var apiService = ApiService()
    
    func fetchJokesData(completion: @escaping (Joke?) -> ()) {
        
        apiService.getJokeData(router: .getRandomJoke, type: Joke.self) { result in
            switch result {
            case .success(let joke):
                completion(joke)
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }

}
