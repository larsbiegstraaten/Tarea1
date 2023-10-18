
import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var bigImageView: UIImageView!
    let ImagesList = [UIImage(named: "blastoise"), UIImage(named: "charmander"), UIImage(named: "BULBASUR"),UIImage(named: "DRATINI"), UIImage(named: "EVEE"), UIImage(named: "meowth")]
    var ImagesListShuffled: [UIImage?]?
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
       // let numbers = [0, 1, 2, 3, 4, 5]
        ImagesListShuffled = ImagesList.shuffled()
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
            
        

    }
    
    @objc func updateTimer(){
        
    }
    
    func randomizeOrder() {

    }

}
