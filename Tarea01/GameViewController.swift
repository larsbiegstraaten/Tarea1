
import UIKit

var numbersShuffled: [Int]?

class GameViewController: UIViewController {

    @IBOutlet weak var bigImageView: UIImageView!
    let ImagesList = [UIImage(named: "blastoise"), UIImage(named: "charmander"), UIImage(named: "BULBASUR"),UIImage(named: "machop"), UIImage(named: "EVEE"), UIImage(named: "meowth")]
    var timer: Timer?
    var counter: Int = 0
    @IBOutlet weak var toEndOfGame: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let numbers = [0, 1, 2, 3, 4, 5]
        numbersShuffled = numbers.shuffled()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        toEndOfGame.isEnabled = false
    }
    
    @objc func updateTimer(){
        print(numbersShuffled![counter])
        bigImageView.image = ImagesList[numbersShuffled![counter]]
        counter += 1        
        if counter == 6 {
            toEndOfGame.isEnabled = true
            timer?.invalidate()
        }
    }

    @IBAction func toEndOfGame(_ sender: UIButton) {
        performSegue(withIdentifier: "toGameResolution", sender: nil)

    }
}
