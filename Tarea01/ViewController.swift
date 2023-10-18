//
//  ViewController.swift
//  Tarea01
//
//  Created by user212831 on 10/17/23.
//

import UIKit


class ViewController: UIViewController {

    @IBAction func startButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goToGame", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

