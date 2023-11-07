//
//  GameResolutionViewController.swift
//  Tarea01
//
//  Created by user212831 on 10/19/23.
//

import UIKit

var finalScore = 0

class GameResolutionViewController: UIViewController {

    @IBOutlet weak var textField1: UITextField!

    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var textField3: UITextField!
    
    @IBOutlet weak var textField4: UITextField!
    
    @IBOutlet weak var textField5: UITextField!
    
    @IBOutlet weak var textField6: UITextField!
    
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var image4: UIImageView!
    
    @IBOutlet weak var image5: UIImageView!
    
    @IBOutlet weak var image6: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image1.image = UIImage(named: "blastoise")
        image2.image = UIImage(named: "charmander")
        image3.image = UIImage(named: "BULBASUR")
        image4.image = UIImage(named: "machop")
        image5.image = UIImage(named: "EVEE")
        image6.image = UIImage(named: "meowth")
    }

    @IBAction func toGameResultsButton(_ sender: UIButton) {
        let field1 = textField1.text
        let field2 = textField2.text
        let field3 = textField3.text
        let field4 = textField4.text
        let field5 = textField5.text
        let field6 = textField6.text
        let respuestas = [field1, field2, field3, field4, field5, field6]
        
        let positionBlastoise = numbersShuffled?.firstIndex(of: 0)
        let positionCharmander = numbersShuffled?.firstIndex(of: 1)
        let positionBulbasur = numbersShuffled?.firstIndex(of: 2)
        let positionMachop = numbersShuffled?.firstIndex(of: 3)
        let positionEvee = numbersShuffled?.firstIndex(of: 4)
        let positionMeowth = numbersShuffled?.firstIndex(of: 5)
        let correctPositions = [positionBlastoise, positionCharmander, positionBulbasur, positionMachop, positionEvee, positionMeowth]
        
        if Int(respuestas[0]!) == Int((correctPositions[0]! + 1)) {
            finalScore += 10
        }
        if Int(respuestas[1]!) == Int(correctPositions[1]! + 1) {
            finalScore += 10
        }
        if Int(respuestas[2]!) == Int(correctPositions[2]! + 1) {
            finalScore += 10
        }
        if Int(respuestas[3]!) == Int(correctPositions[3]! + 1) {
            finalScore += 10
        }
        if Int(respuestas[4]!) == Int(correctPositions[4]! + 1) {
            finalScore += 10
        }
        if Int(respuestas[5]!) == Int(correctPositions[5]! + 1) {
            finalScore += 10
        }


        print("Boton tocado")
        
        performSegue(withIdentifier: "toResultsView", sender: nil)
    }
    
    
}
