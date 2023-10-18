
import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var bigImageView: UIImageView!
    let ImagesList = [UIImage(named: "blastoise"), UIImage(named: "charmander"), UIImage(named: "BULBASUR"),UIImage(named: "DRATINI"), UIImage(named: "EVEE"), UIImage(named: "meowth")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bigImageView.image = ImagesList[0]
        
    }
    

}
