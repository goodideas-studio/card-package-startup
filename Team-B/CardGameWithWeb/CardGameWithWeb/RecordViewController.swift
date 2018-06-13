//
//  RecordViewController.swift
//  CardGameWithWeb
//
//  Created by Morris on 2018/6/13.
//  Copyright © 2018 Morris. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {
    
    let charactorArray = ["6","10","20","24","27","42","46","56","69","90"]
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
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let redAnimation = createImages(name: "card_aura_red_128x128_")
        let blueAnimation = createImages(name: "card_aura_blue_128x128_")
        let greenAnimation = createImages(name: "card_aura_green_128x128_")
        let grayAnimation = createImages(name: "card_aura_gray_128x128_")
        
        let firstRecord = [["charactor":"\(charactorArray[0])","background":"cardBackground05"],
                           ["charactor":"6","\(charactorArray[1])":"cardBackground05"],
                           ["charactor":"6","\(charactorArray[2])":"cardBackground04"],
                           ["charactor":"6","\(charactorArray[3])":"cardBackground03"],
                           ["charactor":"6","\(charactorArray[4])":"cardBackground02"],
                           ["charactor":"6","\(charactorArray[5])":"cardBackground01"]]
        playRecords.append(firstRecord)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardRecordCell
        
        cell.recordLabel.text = "第 \(indexPath.item) 抽"
        switch indexPath.item {
        case 0:
            cell.animationView.image = UIImage.animatedImage(with: redAnimation, duration: 2)
            cell.colorView.image = UIImage(named: "cardBackground05")
        case 1:
            cell.animationView.image = UIImage.animatedImage(with: blueAnimation, duration: 2)
            cell.colorView.image = UIImage(named: "cardBackground04")
        case 2:
            cell.animationView.image = UIImage.animatedImage(with: greenAnimation, duration: 2)
            cell.colorView.image = UIImage(named: "cardBackground03")
        case 3:
            cell.animationView.image = UIImage.animatedImage(with: grayAnimation, duration: 2)
            cell.colorView.image = UIImage(named: "cardBackground02")
        case 4:
            cell.animationView.image = UIImage.animatedImage(with: grayAnimation, duration: 2)
            cell.colorView.image = UIImage(named: "cardBackground01")
            
        case 5:
            cell.cardView.image = UIImage(named: playRecords[0]["charactor"]!)
            cell.colorView.image = UIImage(named: playRecords[0]["background"]!)
            cell.animationView.image = UIImage.animatedImage(with: redAnimation, duration: 2)
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
