
import UIKit

class ResultsViewController: UIViewController, UITableViewDataSource {


    @IBOutlet weak var botonSaveHigh: UIButton!
    @IBOutlet weak var highScoresTableView: UITableView!
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    var userName = ""
    var highScores: [result] = []
    let currentHighScore = UserDefaults.standard.integer(forKey: "highscore")
    var body = ""
    let url = URL(string: "https://api.restful-api.dev/objects")
    var ids: [String] = []
    
    
    
    @IBOutlet weak var titleName: UILabel!
    override func viewDidLoad() {

        resultsLabel.text = "Su resultado es: \(finalScore) / 60"
        highScoresTableView.dataSource = self
        retrieveData()

        
    }
    
    // gestiona cuantas filas deben de salir
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return highScores.count
    }
    
    // gestiona el contenido de cada fila
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreCell") as! cellView
        cell.nameLabel.text = highScores[indexPath.row].name
        cell.scoreLabel.text = highScores[indexPath.row].score.description
        // obtener los datos de la API y ordenar de mayor a menor
        highScores = []
        return cell
    }
    func saveHighscore(finalScore: Int, userName: String) {
        UserDefaults.standard.set(nameTextField.text , forKey: "userName")
        UserDefaults.standard.set(finalScore, forKey: "highscore")
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if finalScore > currentHighScore {
            saveHighscore(finalScore: finalScore, userName: nameTextField.text!)
        }
        userName = nameTextField.text!
        generatePostURL()
        retrieveData()
        updateData()
        
        botonSaveHigh.isEnabled = false
    }
    
    func updateData(){
        highScores.append(result(finalScore , nameTextField.text ?? "xxxx"))
        highScores.sort { (result1, result2) -> Bool in
            
            return result1.score > result2.score
        }
        highScoresTableView.reloadData()
    }
    
    func generatePostURL(){
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let parameters: [String: Any] = [
            "name": userName,
            "data": [
                "highScore": finalScore,
                "userName": userName
            ]
        ]
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: [])
            request.httpBody = jsonData
        } catch {
            print("Error: \(error)")
        }
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            if let data = data {
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    let id = jsonResponse!["id"] as? String
                    self.ids.append(id!)
                    print("Response: \(String(describing: jsonResponse))")
                } catch {
                    print("Error: \(error)")
                }
            }
        }
        task.resume()

        
    }
    func generateURL() -> String {
        var url = "https://api.restful-api.dev/objects"
        for id in ids {
            url += "id=" + id + "&"
        }
        url.removeLast()
        return url
    }
    func retrieveData(){
        let request = URL(string: generateURL())
        let task = URLSession.shared.dataTask(with: request!) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            if let data = data {
                do {
                    // Parseo Json
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Response: \(jsonResponse)")
                    if let jsonArray = jsonResponse as? [[String: Any]] {
                        // cojer todas las entradas que tengan el id que me he guardado
                  //      var name = jsonArray[]["name"]
                            print("Hola")
                            print(jsonArray[0]["name"])
                    }
                } catch {
                    print("Error: \(error)")
                }
            }
        }
        task.resume()
    }
    
}
