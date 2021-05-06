//
//  ViewController.swift
//  TabBar
//
//  Created by MTWDM on 24/04/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = UITableViewCell(style: .default, reuseIdentifier:  nil)

        celda.textLabel?.text = playas[indexPath.row].nombre + "(" + playas[indexPath.row].sustancia + ")"
        return celda
        
    }
    func obtienjson(completed:@escaping()->()){
        let url = URL(string:"https://grupohernandezalba.com/farmacia.json")
        
        URLSession.shared.dataTask(with: url!) {
            (data,response,error) in
            
            if error == nil{
                do {
                    self.playas = try JSONDecoder().decode([Playas].self, from: data!)
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
    
    var playas = [Playas]()
    @IBOutlet weak var Tabla: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        obtienjson {
            print("OK")
            
            self.Tabla.reloadData()
        }
        // Do any additional setup after loading the view.
        Tabla.delegate = self
        Tabla.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "DetPlayaSegue", sender: indexPath.row)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "DetPlayaSegue"{
            
            let idSeleccionado = sender as! Int
            let detalleVC:ViewControllerPlayaDetalle = segue.destination as! ViewControllerPlayaDetalle
            
            detalleVC.nombreDet = playas[idSeleccionado].nombre
            detalleVC.descricionDet = playas[idSeleccionado].dosis
            detalleVC.sustanciaDet = playas[idSeleccionado].sustancia
            let ur = URL(string: "https://servidorgha4.com/delta/fotosdeproducto/" + playas[idSeleccionado].foto )
            
            let dato = try? Data(contentsOf: ur!)

            detalleVC.imagenDet = UIImage(data: dato!)!
        }
    }
  		
}
	
