//
//  ViewController.swift
//  Tarea01
//
//  Created by user212831 on 10/17/23.
//

import UIKit


class ViewController: UIViewController {

    
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImageView.image = UIImage(named: "logo")
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goToGame", sender: nil)
    }

}

