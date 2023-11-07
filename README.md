# ❕ **POKEMORY** ❕ (Tarea 1)
## By Lars Biegstraaten
---
Este proyecto en desarrollo se trata de un juego estilo *Memory* para moviles con el sistema operativo IOS, desarrollado en el entorno *Xcode*, y en lenguaje de programación *Swift*  
  
  Este proyecto me ha servido para aprender:
- Manejo del entorno de desarrollo Xcode
- Mejor uso del lenguaje Swift
- Control de versiones tanto en remoto como on-line (Git y GitHub)
- Uso de una API en profundidad

### Ejemplos de código
#### Método para generar Endpoint en la API
    func generateURL() -> String {
        var url = "https://api.restful-api.dev/objects?"
        for id in ids {
            url += "id=" + id + "&"
        }
        url.removeLast()
        return url
    }
#### Método para hacer la petición POST de la API
    func postHighScore(){
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
                    self.reOrderData()

                    self.retrieveData()
                    print("Response: \(String(describing: jsonResponse))")
                } catch {
                    print("Error: \(error)")
                }
            }
        }
        task.resume()
    }
#### Método para reordenar los resultados y refrescar los datos de nuestra TableView
    func reOrderData(){
        highScores.sort { (result1, result2) -> Bool in
            
            return result1.score > result2.score
        }
        highScoresTableView.reloadData()
    }
