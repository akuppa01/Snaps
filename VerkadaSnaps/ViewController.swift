//
//  ViewController.swift
//  VerkadaSnaps
//
//  Created by Aditya Kuppa on 11/19/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myCV: UICollectionView!
    @IBOutlet weak var CVtopConstraint: NSLayoutConstraint!
    
    var screenWidth = 0.0
    var screenHeight = 0.0
    var currImage = UIImage()
    
    var imageArray : [UIImage] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageArray = PhotoFetcher().imageArray
        print("------  \(imageArray.count)  ------")
        // Do any additional setup after loading the view.
        myCV.dataSource = self
        myCV.delegate = self
        myCV.collectionViewLayout = UICollectionViewFlowLayout()
        screenWidth = view.frame.width
        screenHeight = view.frame.height
//        self.view.setNeedsLayout()
    }
//
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        if UIDevice.current.orientation.isLandscape {
//            print("Landscape")
//            var temp = screenWidth
//            screenWidth = screenHeight
//            screenHeight = temp
//            print("\(screenWidth)   \(screenHeight)")
//
//        } else if UIDevice.current.orientation.isPortrait {
//            print("Portrait")
//            var temp = screenWidth
//            screenWidth = screenHeight
//            screenHeight = temp
//            print("\(screenWidth)   \(screenHeight)")
//
//        }
//    }


}


extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        print("You tapped image \(imageArray[indexPath.row]) !")
//        Vals(superImg: imageArray[indexPath.row])
        currImage = imageArray[indexPath.row]
        addDisplayImage(img: imageArray[indexPath.row])
        addButtons()
//        let image = imageArray[indexPath.row]
//        let text = OCR().getText(image: image)
//        let vc = storyboard?.instantiateViewController(identifier: "ImageDetailsVC") as! ImageDetailsVC
//        vc.config(image: image, text: text)
//        self.navigationController?.pushViewController(vc, animated: true)
//
    }

    //adds display image, sets bounds, changes collection view bounds
    func addDisplayImage(img: UIImage){
        let imageView = UIImageView(image: img)
//        imageView.frame = CGRect(x: self.view.bounds.width / 4, y: 80, width: self.view.bounds.width / 2, height: self.view.bounds.width / 2)
        imageView.frame = CGRect(x: screenWidth / 4, y: 80, width: screenWidth / 2, height: screenWidth / 2)

        view.addSubview(imageView)
        
        CVtopConstraint.constant = screenHeight / 2
    }

    func addButtons(){
        let dbutton = UIButton()
        dbutton.frame = CGRect(x: screenWidth / 4 - 20, y: 80 + screenWidth / 2 + 20, width: screenWidth / 4, height: 50)
        dbutton.backgroundColor = UIColor.green
        dbutton.setTitle("Details", for: .normal)
        dbutton.addTarget(self, action: #selector(detailsButtonAction), for: .touchUpInside)
        
        let fbutton = UIButton()
        fbutton.frame = CGRect(x: screenWidth / 2 + 20, y: 80 + screenWidth / 2 + 20, width: screenWidth / 4, height: 50)
        fbutton.backgroundColor = UIColor.orange
        fbutton.setTitle("Full Screen", for: .normal)
        fbutton.addTarget(self, action: #selector(fsButtonAction), for: .touchUpInside)
        
        
        self.view.addSubview(dbutton)
        self.view.addSubview(fbutton)

    }
   
    
    @objc func detailsButtonAction(sender: UIButton!) {
        let vc = storyboard?.instantiateViewController(identifier: "ImageDetailsVC") as! ImageDetailsVC
        vc.config(img: currImage)
        self.navigationController?.pushViewController(vc, animated: true)
        print("Details Button tapped")
    }
    
    @objc func fsButtonAction(sender: UIButton!) {
        let vc = storyboard?.instantiateViewController(identifier: "FullScreenVC") as! FullScreenVC
        vc.config(img: currImage)
        self.navigationController?.pushViewController(vc, animated: true)
        print("FS Button tapped")
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

