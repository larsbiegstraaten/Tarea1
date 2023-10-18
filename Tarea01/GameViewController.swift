
import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var bigImageView: UIImageView!
    let ImagesList = [UIImage(named: "blastoise"), UIImage(named: "charmander"), UIImage(named: "BULBASUR"),UIImage(named: "DRATINI"), UIImage(named: "EVEE"), UIImage(named: "meowth")]
    var ImagesListShuffled: [UIImage?]?
    var timer: Timer?
    var numbersShowed: [Int]?
    var counter: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
       // let numbers = [0, 1, 2, 3, 4, 5]
        ImagesListShuffled = ImagesList.shuffled()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
            
        

    }
    
    @objc func updateTimer(){
        let randomInt = Int.random(in: 0..<6)
        
        bigImageView.image = ImagesListShuffled![randomInt]
        numbersShowed?.append(randomInt)
        counter += 1
        if counter == 6 {
            timer?.invalidate()
        }
    }
    
    func randomizeOrder() {

    }

}
