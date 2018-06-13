//
//  MyCollectionViewController.swift
//  SlotMachine
//
//  Created by JeremyXue on 2018/6/13.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit
import JavaScriptCore

class MyCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var myCollectionArray = [[String:Any]]()
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        if let collectionArray = UserDefaults.standard.value(forKey: "imageDic") {
            myCollectionArray = collectionArray as! [[String:Any]]
            print("接收到\(myCollectionArray)")
        }
        
        myCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myCollectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let myCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionCell", for: indexPath) as! MyCollectionViewCell
        
        myCollectionCell.characterImage.image = UIImage(named: "\(myCollectionArray[indexPath.row]["name"]!)")
        myCollectionCell.maskImage.image = UIImage(named: "C\(myCollectionArray[indexPath.row]["color"]!)")
        
        
        myCollectionCell.characterInfo.text = "第\(indexPath.row + 1)抽 * \(myCollectionArray[indexPath.row]["number"]!)"
        
        return myCollectionCell
        
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
