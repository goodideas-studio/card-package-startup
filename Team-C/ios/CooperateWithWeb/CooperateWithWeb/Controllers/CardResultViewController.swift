//
//  CardResultViewController.swift
//  CooperateWithWeb
//
//  Created by EthanLin on 2018/6/13.
//  Copyright © 2018 EthanLin. All rights reserved.
//

import UIKit

class CardResultViewController: UIViewController {
    
    let jsonString = UserDefaults.standard.string(forKey: UserDefaultsKeyManager.resultJSON)
    
    @IBOutlet weak var cardResultCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardResultCollectionView.delegate = self
        cardResultCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension CardResultViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardResultCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardResultCell", for: indexPath) as! CardResultCollectionViewCell
        return cardResultCell
    }
    
    
}
