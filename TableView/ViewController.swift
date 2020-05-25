//
//  ViewController.swift
//  TableView
//
//  Created by Ali Atakan AKMAN on 25.05.2020.
//  Copyright © 2020 Ali Atakan AKMAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var KaramanNames = [String]()
    var KaramanImages = [UIImage]()
    var choosenCellName = ""
    var choosenCellImage = UIImage()
    
   
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //ViewController a eşitlememiz gerekiyor. Burası önemli.
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        //DATA's
        
        
        KaramanNames.append("İncesu Mağarası")
        KaramanNames.append("Manazan Mağarası")
        KaramanNames.append("Mennan Kalesi")
        KaramanNames.append("Meraspolis Mağarası")
        KaramanNames.append("Taşkale Tahıl Ambarı")
    
        
        KaramanImages.append(UIImage(named: "İncesu Mağarası")!)
        KaramanImages.append(UIImage(named: "Manazan Mağarası")!)
        KaramanImages.append(UIImage(named: "Mennan Kalesi")!)
        KaramanImages.append(UIImage(named: "Meraspolis Mağarası")!)
        KaramanImages.append(UIImage(named: "Taşkale Tahıl Ambarı")!)
        
        }
    //Değiştire stilini ayarlıyoruz.
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            KaramanNames.remove(at: indexPath.row)
            KaramanImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            
            
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
        return KaramanNames.count
        
        }
       
    
    
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           let cell = UITableViewCell()
           cell.textLabel?.text = KaramanNames[indexPath.row]  //İndexpath hangi dizideysek sıraylaindecleri verir.
           return cell                                      //Dizi Senkronizasyonu
        
       }
    
    
    
    
    //DidSelect seçilince ne olacak fonskiyonudur.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Seçilen cell in seçimini kaldırmak için :
        tableView.deselectRow(at: indexPath, animated: true)
        
        choosenCellName = KaramanNames[indexPath.row]
        choosenCellImage = KaramanImages[indexPath.row]
            
        performSegue(withIdentifier: "toImageViewController", sender: nil)

        

    }
    
    //Segue olmadan önce yapılacak olan işlem için
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toImageViewController" {
            
            //gidilecek olan VC yi değişkene atarak tanımladık.
            let destinationVC = segue.destination as! ImageViewController
            destinationVC.selectedCellName = choosenCellName
            destinationVC.selectedCellImage = choosenCellImage
            
            
        }
        
    }
    
    
    
    
}

