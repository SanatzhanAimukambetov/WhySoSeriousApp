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
    
    var viewModel = RandomJokeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
        loadData()
        
    }
    
    private func loadData() {
        viewModel.fetchJokesData { [weak self] joke in
            guard let joke = joke else { return }
            self?.configure(by: joke)
        }
    }
    
    private func configure(by joke: Joke) {
        setupLabel.text = joke.setup
        jokeLabel.text = joke.joke
    }
    
    private func setupLabels() {
        setupLabel.isHidden = true
        setupLabel.lineBreakMode = .byCharWrapping
        jokeLabel.isHidden = true
        jokeLabel.lineBreakMode = .byCharWrapping
    }
}
