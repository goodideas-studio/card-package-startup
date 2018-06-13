//
//  WebViewController.swift
//  SlotMachine
//
//  Created by JeremyXue on 2018/6/13.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit
import WebKit
import JavaScriptCore

@objc protocol JavaScriptFuncProtocol: JSExport {
    func getMoney() -> Int
    func getCardInfo(_ imageName:String,_ imageColor:Int)
    func updateMoney(_ money:Int)
}

class JavaScriptMethod : NSObject, JavaScriptFuncProtocol {
    
    func getMoney() -> Int{
        
        print("拿到錢")
        
        if UserDefaults.standard.value(forKey: "money") != nil{
            return UserDefaults.standard.value(forKey: "money") as! Int
        }
        
        UserDefaults.standard.set(500, forKey: "money")
        return 500
    }
    
    func updateMoney(_ money:Int) {
        
        print("更新錢")
        UserDefaults.standard.set(money, forKey: "money")
        print(UserDefaults.standard.value(forKey: "money") as! Int)
    }
    
    // 取得卡片資訊
    func getCardInfo(_ imageName: String,_ imageColor: Int) {
        
        if UserDefaults.standard.value(forKey: "imageDic") == nil {
            let imageDic = [["name":imageName,"color":imageColor,"number":1]]
            
            UserDefaults.standard.set(imageDic, forKey: "imageDic")
        } else {
            var imageDic = UserDefaults.standard.value(forKey: "imageDic") as! [[String:Any]]
//            print("有值\(imageDic)")
            let thisDic = ["name":imageName,"color":imageColor,"number":1] as [String : Any]
            
            for i in 0..<imageDic.count {
                if imageDic[i]["name"] as! String == thisDic["name"] as! String {
                    var number = imageDic[i]["number"] as! Int
                    number += 1
                    imageDic[i]["number"] = number
                } else {
                    imageDic.append(thisDic)
                    UserDefaults.standard.set(imageDic, forKey: "imageDic")
                }
            }
        }
        print(UserDefaults.standard.value(forKey: "imageDic") as! [[String:Any]] )

    }
    
}

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let url = Bundle.main.url(forResource: "index", withExtension: ".html")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
        
        let jsContext = self.webView.value(forKeyPath: "documentView.webView.mainFrame.javaScriptContext") as? JSContext
        jsContext?.setObject(JavaScriptMethod(), forKeyedSubscript: "javaScriptCallToSwift" as (NSCopying & NSObjectProtocol)!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 開始遊戲
 
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
