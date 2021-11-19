//
//  ViewController.swift
//  VerkadaSnaps
//
//  Created by Aditya Kuppa on 11/19/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var navig: UINavigationBar!
    @IBOutlet weak var collect: UICollectionView!
    
    var imageArray : [UIImage] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageArray = PhotoFetcher().imageArray
        print("------  \(imageArray.count)  ------")
        // Do any additional setup after loading the view.
        collect.dataSource = self
        collect.delegate = self
        collect.collectionViewLayout = UICollectionViewFlowLayout()

    }


}


extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        print("You tapped image \(imageArray[indexPath.row]) !")
//        let image = imageArray[indexPath.row]
//        let text = OCR().getText(image: image)
//        let vc = storyboard?.instantiateViewController(identifier: "ImageDetailsVC") as! ImageDetailsVC
//        vc.config(image: image, text: text)
//        self.navigationController?.pushViewController(vc, animated: true)
//
    }

}
    
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCVCell", for: indexPath) as! GalleryCVCell
        cell.setImage(image: imageArray[indexPath.row])
        return cell
    }

}
    
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let imgPerRow = 3
        let frameWidth = collectionView.frame.width
        let width = (Int(frameWidth) / imgPerRow) - 2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}

