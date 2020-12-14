//
//  ApiService.swift
//  WhySoSeriousApp
//
//  Created by Sanatzhan Aimukambetov on 14.12.2020.
//

import Foundation

class ApiService {

    enum Router {
        case getRandomJoke
        case getTenJokes
        
        private var baseURL: String {
            return "https://official-joke-api.appspot.com/jokes/ten"
        }
        
        private var path: String {
            switch self {
            case .getRandomJoke: return "/random"
            case .getTenJokes: return "/ten"
            }
        }
        
        var url: String {
            return baseURL + path
        }
    }
    
    private var dataTask: URLSessionDataTask?
    var oneJoke = [Joke]()
    
    func getJokeData(router: Router, completion: @escaping (Result<[Joke], NetworkError>) -> Void) {
        
        guard let url = URL(string: router.url) else {
            completion(.failure(.URLError))
            return
        }
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(.internetError))
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
