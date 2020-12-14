//
//  ApiService.swift
//  WhySoSeriousApp
//
//  Created by Sanatzhan Aimukambetov on 14.12.2020.
//

import Foundation

class ApiService {
    
    private var dataTask: URLSessionDataTask?
    var oneJoke = [Joke]()
    
    private enum router {
        case getRandomJoke
        case getTenJokes
    }
    
    func getJokeData(completion: @escaping (Result<[Joke], NetworkError>) -> Void) {
        
        let randomJokeURL = "https://official-joke-api.appspot.com/jokes/ten"
        
        guard let url = URL(string: randomJokeURL) else {
            completion(.failure(.URLError))
            return
        }
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(.internetError))
                print(error)
                return
            }
            
            guard let data = data else {
                completion(.failure(.dataError))
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Joke].self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch _ {
                completion(.failure(.JSONError))
            }
            
        }
        dataTask?.resume()
    }
    
}

enum NetworkError: String, Error {
    case URLError = "URL error."
    case internetError = "No internet."
    case dataError = "Data error."
    case JSONError = "JSON error."
    case responseError = "Response error."
}
