//
//  PueblosViewController.swift
//  TabBar
//
//  Created by MTWDM on 03/05/21.
//

import UIKit

class PueblosViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pueblos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = UITableViewCell(style: .default, reuseIdentifier: nil)
        celda.textLabel?.text = pueblos[indexPath.row].Lugar
        return celda
    }
    func ObtJson(completed:@escaping()->()){
        let url = URL(string:"https://raw.githubusercontent.com/andromedagalaxia/json/master/pueblos.json")
                                    
                URLSession.shared.dataTask(with: url!) {
                        (data,response,error) in
                                        
                        if error == nil{
                            do {
                                self.pueblos = try JSONDecoder().decode([Pueblos].self, from: data!)
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
    var pueblos = [Pueblos]()
    @IBOutlet weak var TablaPueblos: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ObtJson {
            print("listo")
            self.TablaPueblos.reloadData()
        }
        TablaPueblos.delegate = self
        TablaPueblos.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sendser: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
