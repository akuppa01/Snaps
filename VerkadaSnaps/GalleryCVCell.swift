//
//  CollectionViewCell.swift
//  VerkadaSnaps
//
//  Created by Aditya Kuppa on 11/19/21.
//

import UIKit


class GalleryCVCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    
    
    func setImage(image: UIImage) {
        img.image = image
    }
    
    
}

