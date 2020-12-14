//
//  RandomJokeViewController.swift
//  WhySoSeriousApp
//
//  Created by Sanatzhan Aimukambetov on 14.12.2020.
//

import UIKit

class RandomJokeViewController: UIViewController {
    
    @IBOutlet var setupLabel: UILabel!
    @IBOutlet var jokeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
        
        let url = "https://official-joke-api.appspot.com/jokes/random"
        getData(from: url)
        
    }
    
    private func getData(from url: String) {
        
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("Something went wrong")
                return
            }
            
            var result: Joke?
            do {
                result = try JSONDecoder().decode(Joke.self, from: data)
            }
            catch {
                print(error)
            }
            
            guard let json = result else {
                return
            }
            
            DispatchQueue.main.async {
                self.jokeLabel.isHidden = false
                self.setupLabel.isHidden = false
                self.jokeLabel.text = json.joke
                self.setupLabel.text = json.setup
            }
        })
        
        task.resume()
    }
    
    private func setupLabels() {
        setupLabel.isHidden = true
        setupLabel.lineBreakMode = .byCharWrapping
        jokeLabel.isHidden = true
        jokeLabel.lineBreakMode = .byCharWrapping
    }
}
