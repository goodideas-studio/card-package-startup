//
//  MyCollectionViewController.swift
//  SlotMachine
//
//  Created by JeremyXue on 2018/6/13.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class MyCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var myCollectionArray = [CardModel]()
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var myCollectionLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCollectionLayout.itemSize = CGSize(width: 200, height: 200)
        
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let myCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionCell", for: indexPath) as! MyCollectionViewCell
        
        myCollectionCell.backgroundColor = UIColor.blue
        myCollectionCell.characterInfo.text = "測試測試\(indexPath.row)"
        
        return myCollectionCell
        
    }
    
    
    // 接收卡片資訊
    func receiveCard(imageName:String,imageColor:String,number:Int) {
        
        let card = CardModel(imageName: imageName, imageColor: imageColor, number: 1)
        
        for i in 0..<myCollectionArray.count {
            
            // 判斷是否擁有該卡片，若有則增加數量，若沒有則加入 Array。
            if myCollectionArray[i].imageName == card.imageName {
                myCollectionArray[i].number += 1
            } else {
                myCollectionArray.append(card)
            }
        }
        
        myCollectionView.reloadData()
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
