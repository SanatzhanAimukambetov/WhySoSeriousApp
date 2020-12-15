//
//  ViewController.swift
//  WhySoSeriousApp
//
//  Created by Sanatzhan Aimukambetov on 14.12.2020.
//

import UIKit

class JokesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var viewModel: JokeViewModel?
    var idString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        loadData()
    }
    
    private func loadData() {
        viewModel?.fetchJokesData { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jokeID", for: indexPath) as! JokeTableViewCell
        
        let joke = viewModel?.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(joke)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let count = viewModel?.numberOfRowsInSection(), indexPath.row == count - 2 {
            loadData()
        }
    }

}

