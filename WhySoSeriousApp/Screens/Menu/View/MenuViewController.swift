//
//  MenuViewController.swift
//  WhySoSeriousApp
//
//  Created by Sanatzhan Aimukambetov on 14.12.2020.
//

import UIKit

class MenuViewController: UIViewController {
    
    let viewModel = MenuViewModel()
    
    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var buttonToTable: UIButton!
    @IBOutlet var buttonToSingleJoke: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImage()
        showAnimatedButtons(button: buttonToTable)
        showAnimatedButtons(button: buttonToSingleJoke)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tableOfJokes" {
            if let vc = segue.destination as? JokesViewController {
                vc.viewModel = viewModel.createJokeViewModel()
            }
        }
    }
    
    private func showAnimatedButtons(button: UIButton) {
        button.alpha = 0
        button.transform = CGAffineTransform(translationX: 0, y: (view.bounds.height)/2)
        UIView.animate(withDuration: 1.5) {
            button.transform = .identity
            button.alpha = 1
        }
    }
    
    private func setImage() {
        viewModel.imageDownload { (data) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.mainImage.image = UIImage(data: data)
            }
        }
    }
    
}
