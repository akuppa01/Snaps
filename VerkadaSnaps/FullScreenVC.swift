//
//  FullScreenVC.swift
//  VerkadaSnaps
//
//  Created by Aditya Kuppa on 11/20/21.
//

import Foundation
import UIKit

class FullScreenVC: UIViewController {
    
    @IBOutlet weak var displayImage: UIImageView!
    
    var imgVar = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        displayImage.image = imgVar

    }
    
    func config(img: UIImage) {
        imgVar = img
    }

    
}

