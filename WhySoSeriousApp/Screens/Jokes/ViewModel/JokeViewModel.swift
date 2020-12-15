//
//  JokeViewModel.swift
//  WhySoSeriousApp
//
//  Created by Sanatzhan Aimukambetov on 14.12.2020.
//

import Foundation

class JokeViewModel {
    var saveJokes: (([Joke]?) -> ())?
    
    private var apiService = ApiService()
    private var tenJokes = [Joke]()
    private var isFirstTime = true
    
    init(jokes: [Joke]) {
        self.tenJokes = jokes
    }
    
    func fetchJokesData(completion: @escaping () -> ()) {
        
        apiService.getJokeData(router: .getTenJokes, type: [Joke].self) { [weak self] (result) in

            switch result {
            case .success(let listOf):
                if let isFirstTime = self?.isFirstTime, isFirstTime {
                    self?.tenJokes = listOf
                    self?.isFirstTime.toggle()
                } else {
                    self?.tenJokes += listOf
                }
                self?.saveJokes?(self?.tenJokes)
                completion()
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }
    
    func numberOfRowsInSection() -> Int {
        if tenJokes.count != 0 {
            return tenJokes.count
        }
        return 0
    }
    
    func cellForRowAt (indexPath: IndexPath) -> Joke {
        return tenJokes[indexPath.row]
    }
}
