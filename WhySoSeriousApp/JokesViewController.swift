//
//  ViewController.swift
//  WhySoSeriousApp
//
//  Created by Sanatzhan Aimukambetov on 14.12.2020.
//

import UIKit

class JokesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    private var viewModel = JokeViewModel()
    var idString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchJokesData { [weak self] in
            self?.tableView.delegate = self
            self?.tableView.dataSource = self
            self?.tableView.reloadData()
        }
        
        tableView.separatorStyle = .none

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jokeID", for: indexPath) as! JokeTableViewCell
        
        let joke = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(joke)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}

