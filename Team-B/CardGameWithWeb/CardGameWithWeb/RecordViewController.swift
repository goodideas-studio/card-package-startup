//
//  RecordViewController.swift
//  CardGameWithWeb
//
//  Created by Morris on 2018/6/13.
//  Copyright © 2018 Morris. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {
    
    @IBOutlet weak var recordCollectionView: UICollectionView!
    let characterArray = ["6","10","20","24","27","42","46","56","69","90"]
    var playRecords = [[String:String]]()
    
    func createImages(name: String) -> [UIImage] {
        var images = [UIImage]()
        for i in 1...30 {
            var imageName: String = name
            if i < 10 {
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
        view.backgroundColor = .black
        recordCollectionView.backgroundColor = .clear
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let getPlayRecord = UserDefaults.standard.array(forKey: "record") else { return }
        guard getPlayRecord.count > 0 else { return }
        playRecords = getPlayRecord as! [[String : String]]
        recordCollectionView.reloadData()
    }
    
}
extension RecordViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if playRecords.count == 0 {
            return 1
        }else{
            return playRecords.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let redAnimation = createImages(name: "card_aura_red_128x128_")
        let blueAnimation = createImages(name: "card_aura_blue_128x128_")
        let greenAnimation = createImages(name: "card_aura_green_128x128_")
        let grayAnimation = createImages(name: "card_aura_gray_128x128_")
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardRecordCell
        
        if playRecords.count == 0 {
            cell.recordLabel.text = "還沒抽卡哦！"
            return cell
        }
        
        guard playRecords.count > 0 else { return cell }
        
        cell.recordLabel.text = "第 \(indexPath.item + 1) 抽"
        cell.colorView.image = UIImage(named: playRecords[indexPath.item]["background"]!)
        cell.cardView.image = UIImage(named: playRecords[indexPath.item]["character"]!)
        cell.animationView.animationDuration = 2
        cell.isUserInteractionEnabled = false
        
        switch playRecords[indexPath.item]["background"] {
        case "cardBackground05":
            cell.animationView.animationImages = redAnimation
            cell.animationView.startAnimating()
            
        case "cardBackground04":
            cell.animationView.animationImages = blueAnimation
            cell.animationView.startAnimating()
            
        case "cardBackground03":
            cell.animationView.animationImages = greenAnimation
            cell.animationView.startAnimating()

        case "cardBackground02":
            cell.animationView.animationImages = grayAnimation
            cell.animationView.startAnimating()

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
