//
//  ImageViewController.swift
//  TableView
//
//  Created by Ali Atakan AKMAN on 25.05.2020.
//  Copyright © 2020 Ali Atakan AKMAN. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    var selectedCellName = ""
    var selectedCellImage = UIImage()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        infoLabel.text = selectedCellName
        imageView.image = selectedCellImage
       
        
    }
    

  

}
