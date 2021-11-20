//
//  ImageDetailsVC.swift
//  VerkadaSnaps
//
//  Created by Aditya Kuppa on 11/19/21.
//

import Foundation
import UIKit

class ImageDetailsVC: UIViewController {

    @IBOutlet weak var viewStack: UIStackView!
    @IBOutlet weak var displayImage: UIImageView!
    @IBAction func fullScreen(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "FullScreenVC") as! FullScreenVC
        vc.config(img: imgVar)
        self.navigationController?.pushViewController(vc, animated: true)
        print("FS Button tapped")

    }
    @IBOutlet weak var dimSize: UILabel!
    @IBOutlet weak var fileSize: UILabel!
    @IBOutlet weak var imgFormat: UILabel!
    @IBOutlet weak var creationDate: UILabel!
    
    var imgVar = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        displayImage.image = imgVar
        preprocess()
    }
    
    func preprocess(){
        //TODO get accurate values from site
        //dimension size
        dimSize.text = "Dimensions: \(imgVar.size.width) x \(imgVar.size.height)"
//        let imgData: Data = imgVar.jpegData(compressionQuality: imgVar.jpegDatacompressionQuality,: 0)!
//        fileSize.text = "File Size: \(imgData.count)"
        imgFormat.text = "JPG"
//        creationDate.text = ""
    }
    
    func config(img: UIImage) {
        imgVar = img
    }

}
