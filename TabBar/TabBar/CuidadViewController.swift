//
//  CuidadViewController.swift
//  TabBar
//
//  Created by MTWDM on 03/05/21.
//

import UIKit

class CuidadViewController: UIViewController,UITableViewDelegate,
UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                    return cuidad.count
                }
                                
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let celda = UITableViewCell(style: .default, reuseIdentifier: nil)
            celda.textLabel?.text = cuidad[indexPath.row].Lugar
                return celda
            }
    func ObtJson(completed:@escaping()->()){
        let url = URL(string:"https://raw.githubusercontent.com/andromedagalaxia/json/master/ciudades.json")
                                    
                URLSession.shared.dataTask(with: url!) {
                        (data,response,error) in
                                        
                        if error == nil{
                            do {
                                self.cuidad = try JSONDecoder().decode([Cuidad].self, from: data!)
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
                            
    var cuidad = [Cuidad]()
    
    @IBOutlet weak var TablaCuidad: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ObtJson {
            print("Listo")
            self.TablaCuidad.reloadData()
        }
        
        TablaCuidad.delegate = self
        TablaCuidad.dataSource = self

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
