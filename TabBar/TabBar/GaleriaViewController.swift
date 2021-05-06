//
//  GaleriaViewController.swift
//  TabBar
//
//  Created by MTWDM on 03/05/21.
//

import UIKit

class GaleriaViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  imagenes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "celda", for: indexPath) as! FotosCollectionViewCell
        celda.fotos.image = UIImage(named: imagenes[indexPath.row])
        return celda
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let pantalla = UIScreen.main.bounds
        return CGSize(width: pantalla.width, height: pantalla.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt mininumLineSpacingForSectionAt: Int) -> CGFloat{
        return 0.0
        
    }
        
    @IBOutlet weak var fot: UIImageView!
    @IBOutlet weak var foto: UIImageView!
    let imagenes:[String] = ["1","2","3","4","5","6","7","8","9","10"]
    @IBOutlet weak var Galeria: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Galeria.delegate = self
        Galeria.dataSource = self
        
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
