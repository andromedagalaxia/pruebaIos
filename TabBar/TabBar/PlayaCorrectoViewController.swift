//
//  PlayaCorrectoViewController.swift
//  TabBar
//
//  Created by MTWDM on 03/05/21.
//

import UIKit

class PlayaCorrectoViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playaCorr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = UITableViewCell(style: .default, reuseIdentifier: nil)
        celda.textLabel?.text = playaCorr[indexPath.row].nombre
        return celda
    }
    func ObtJson(completed:@escaping()->()){
        let url = URL(string:"https://grupohernandezalba.com/farmacia.json")
        
        URLSession.shared.dataTask(with: url!) {
            (data,response,error) in
            
            if error == nil{
                do {
                    self.playaCorr = try JSONDecoder().decode([PlayaCorr].self, from: data!)
                    DispatchQueue.main.async {
                    completed()
                    }
                }
                catch{
                    print("Error al obtener el JSON")
                    print(error)
                }
            }
            
            
        }.resume()
    }
    
    var playaCorr = [PlayaCorr]()
    @IBOutlet weak var PlayaCo: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ObtJson {
            print("OK")
            
            self.PlayaCo.reloadData()
        }
        // Do any additional setup after loading the view.
        PlayaCo.delegate = self
        PlayaCo.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
