//
//  RecordViewController.swift
//  CardGameWithWeb
//
//  Created by Morris on 2018/6/13.
//  Copyright © 2018 Morris. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {
    
    var playRecords = [[String:String]]()
    
    func createImages(name: String) -> [UIImage] {
        
        var images = [UIImage]()
        
        for i in 1...30 {
            var imageName: String = name
            if i < 10 {
                //card_aura_red_128x128_01
                imageName += "0\(i)"
                images.append(UIImage(named: imageName)!)
            } else {
                imageName += "\(i)"
                images.append(UIImage(named: imageName)!)
            }
        }
        return images
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
extension RecordViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardRecordCell
        
        let redAnimation = createImages(name: "card_aura_red_128x128_")
        let blueAnimation = createImages(name: "card_aura_blue_128x128_")
        let greenAnimation = createImages(name: "card_aura_green_128x128_")
        let grayAnimation = createImages(name: "card_aura_gray_128x128_")
        
        switch indexPath.item {
        case 0:
            cell.animationView.image = UIImage.animatedImage(with: redAnimation, duration: 2)
        case 1:
            cell.animationView.image = UIImage.animatedImage(with: blueAnimation, duration: 2)
        case 2:
            cell.animationView.image = UIImage.animatedImage(with: greenAnimation, duration: 2)
        case 3:
            cell.animationView.image = UIImage.animatedImage(with: grayAnimation, duration: 2)
        default:
            break
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 123, height: 150)
    }
}
