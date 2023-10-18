
import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var bigImageView: UIImageView!
    let ImagesList = [UIImage(named: "blastoise"), UIImage(named: "charmander"), UIImage(named: "BULBASUR"),UIImage(named: "DRATINI"), UIImage(named: "EVEE"), UIImage(named: "meowth")]
    var timer: Timer?
    var counter: Int = 0
    var numbersShuffled: [Int]?
    override func viewDidLoad() {
        super.viewDidLoad()
        let numbers = [0, 1, 2, 3, 4, 5]
        numbersShuffled = numbers.shuffled()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
            
        

    }
    
    @objc func updateTimer(){
        print(counter)
        print(numbersShuffled![counter])
        bigImageView.image = ImagesList[numbersShuffled![counter]]
        counter += 1
        
        if counter == 6 {
            timer?.invalidate()
        }

    }
    
    func randomizeOrder() {

    }

}
