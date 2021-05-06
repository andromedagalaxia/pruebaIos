//
//  ViewControllerPlayaDetalle.swift
//  TabBar
//
//  Created by MTWDM on 30/04/21.
//

import UIKit

class ViewControllerPlayaDetalle: UIViewController {

    @IBOutlet weak var sustancia: UILabel!
    @IBOutlet weak var Descripcion: UILabel!
    @IBOutlet weak var Nombre: UILabel!
    @IBOutlet weak var Imagen: UIImageView!
    
    var nombreDet:String?
    var descricionDet:String?
    var imagenDet = UIImage()
    var sustanciaDet: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Nombre.text = nombreDet
        Descripcion.text = descricionDet
        Imagen.image = imagenDet
        sustancia.text = sustanciaDet
        
    }
    


}
