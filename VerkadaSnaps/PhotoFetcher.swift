//
//  PhotoFetcher.swift
//  Hooks
//
//  Created by Aditya Kuppa on 7/3/20.
//  Copyright © 2020 Aditya Kuppa. All rights reserved.
//

import Foundation
import PhotosUI

class PhotoFetcher {
    
    var imageArray = [UIImage]()
    var imageURLs: [URL] = []

    let imagelinks: [String] =
        ["https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492_1280.jpg",
         "https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_1280.jpg",
         "https://cdn.pixabay.com/photo/2018/02/21/05/17/cat-3169476_1280.jpg",
         "https://cdn.pixabay.com/photo/2017/03/14/14/49/cat-2143332_1280.jpg",
         "https://cdn.pixabay.com/photo/2018/01/28/12/37/cat-3113513_1280.jpg",
         "https://cdn.pixabay.com/photo/2014/05/07/06/44/cat-339400_1280.jpg",
         "https://cdn.pixabay.com/photo/2016/06/14/00/14/cat-1455468_1280.jpg",
         "https://cdn.pixabay.com/photo/2013/04/01/03/45/cat-98359_1280.jpg",
         "https://cdn.pixabay.com/photo/2017/07/24/19/57/tiger-2535888_1280.jpg",
         "https://cdn.pixabay.com/photo/2019/11/08/11/56/cat-4611189_1280.jpg",
         "https://cdn.pixabay.com/photo/2016/09/05/21/37/cat-1647775_1280.jpg",
         "https://cdn.pixabay.com/photo/2016/02/10/16/37/cat-1192026_1280.jpg",
         "https://cdn.pixabay.com/photo/2014/03/29/09/17/cat-300572_1280.jpg",
         "https://cdn.pixabay.com/photo/2017/11/09/21/41/cat-2934720_1280.jpg",
         "https://cdn.pixabay.com/photo/2017/11/14/13/06/kitty-2948404_1280.jpg",
         "https://cdn.pixabay.com/photo/2016/07/10/21/47/cat-1508613_1280.jpg",
         "https://cdn.pixabay.com/photo/2017/07/25/01/22/cat-2536662_1280.jpg",
         "https://cdn.pixabay.com/photo/2015/11/16/14/43/cat-1045782_1280.jpg",
         "https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_1280.jpg",
         "https://cdn.pixabay.com/photo/2013/05/30/18/21/cat-114782_1280.jpg",
         "https://cdn.pixabay.com/photo/2015/03/27/13/16/cat-694730_1280.jpg",
         "https://cdn.pixabay.com/photo/2015/11/16/22/14/cat-1046544_1280.jpg",
         "https://cdn.pixabay.com/photo/2019/05/08/21/21/cat-4189697_1280.jpg",
         "https://cdn.pixabay.com/photo/2016/03/28/10/05/kitten-1285341_1280.jpg",
         "https://cdn.pixabay.com/photo/2012/11/26/13/58/cat-67345_1280.jpg"]
    
    init(){
        loadURLs()
        loadPhotos()
    }
    
    func loadURLs() {
        for link in imagelinks {
            imageURLs.append(URL(string: link)!)
        }
    }
    
    //loads the photos into imageArray and returns it; all done asynchronously (trying to)
    func loadPhotos() {//-> [UIImage] {
//        DispatchQueue.global().async {
            for link in self.imageURLs {
//                print("gg")
                let data = try? Data(contentsOf: link)
//                DispatchQueue.main.async {
                    self.imageArray.append(UIImage(data: data!)!)
//                    print("hhhh")
//                }
            }
//        }
//        return imageArray
    }

    
    

    
   
    
//    func imageDimensions(url: String) -> String{
//
//
//        if let imageSource = CGImageSourceCreateWithURL(URL(string: url)! as CFURL, nil) {
//            if let imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as Dictionary? {
//                print("\n---------  \(imageProperties.count)  ---------\n")
//
//               for key in imageProperties.keys {
//                print("\(key)")
//               }
//                let pixelWidth = imageProperties[kCGImagePropertyPixelWidth] as! Int
//                let pixelHeight = imageProperties[kCGImagePropertyPixelHeight] as! Int
//    //            let fileSize = imageProperties[kCGImagePropertyFileSize] as! String
//    //            return "Width: \(pixelWidth), Height: \(pixelHeight), File Size: \(fileSize)"
//                return "Width: \(pixelWidth), Height: \(pixelHeight)"//", File Size: \(fileSize)"
//
//            }
//        }
//        return "None"
//    }
    
    enum NetworkError: Error {
        case gg
    }
    

    
    
    
    
}
