//
//  CardModel.swift
//  SlotMachine
//
//  Created by JeremyXue on 2018/6/13.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import Foundation


struct CardModel {
    
    let imageName:String
    let imageColor:Int
    var number:Int
    
    init(imageName:String,imageColor:Int,number:Int) {
        self.imageName = imageName
        self.imageColor = imageColor
        self.number = number
    }
    
}
