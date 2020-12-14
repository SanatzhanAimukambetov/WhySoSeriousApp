//
//  JokeTableViewCell.swift
//  WhySoSeriousApp
//
//  Created by Sanatzhan Aimukambetov on 14.12.2020.
//

import UIKit

class JokeTableViewCell: UITableViewCell {
    
    
    @IBOutlet var bgView: UIView!
    
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var setupLabel: UILabel!
    @IBOutlet var jokeLabel: UILabel!
    
    var idString = ""
    
    func setCellWithValuesOf(_ joke: Joke) {
        updateUI(id: joke.id, type: joke.type, setup: joke.setup, joke: joke.joke)
    }
    
    private func updateUI(id: Int?, type: String?, setup: String?, joke: String?) {
        
        idString = String(id!)
        
        self.idLabel.text = idString
        self.typeLabel.text = type
        self.setupLabel.text = setup
        self.jokeLabel.text = joke
        
    }
}
