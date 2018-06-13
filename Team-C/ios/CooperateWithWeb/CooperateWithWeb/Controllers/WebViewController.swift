//
//  WebViewController.swift
//  CooperateWithWeb
//
//  Created by EthanLin on 2018/6/13.
//  Copyright © 2018 EthanLin. All rights reserved.
//

import UIKit
import JavaScriptCore

@objc protocol JavaScriptFuncProtcol: JSExport{
    func updateMoney(_ money:Int)
    func updateCardList(_ result:String)
    func getMoney()->Int
}

class JavaScriptFunc:NSObject, JavaScriptFuncProtcol{
    
    var gameMoney = 50000
    
    func getMoney()->Int{
        print(self.gameMoney)
        return self.gameMoney
//        if UserDefaults.standard.integer(forKey: UserDefaultsKeyManager.remainingMoney) != nil{
//            print("1")
//            return UserDefaults.standard.integer(forKey: UserDefaultsKeyManager.remainingMoney)
//        }else{
//            print("500")
//            return 500
//        }
    }
    
    func updateCardList(_ result:String){
        print("updateCard")
        UserDefaults.standard.setValue(result, forKey: UserDefaultsKeyManager.resultJSON)
        print(result)
        
    }
    
    func updateMoney(_ money: Int) {
        print("updateMoney")
        UserDefaults.standard.set(money, forKey: UserDefaultsKeyManager.remainingMoney)
    }
    
}

class WebViewController: UIViewController, UIWebViewDelegate{
    
    var jsonDataFromWebView:String? = UserDefaults.standard.string(forKey: UserDefaultsKeyManager.resultJSON) ?? ""{
        didSet{
            UserDefaults.standard.set(jsonDataFromWebView, forKey: UserDefaultsKeyManager.resultJSON)
            print(UserDefaults.standard.string(forKey: UserDefaultsKeyManager.resultJSON))
        }
    }
    var remainingMoney:Int?
    
    @IBOutlet weak var webView: UIWebView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        //測試加載本地HTML頁面
        let url = Bundle.main.url(forResource: "index", withExtension: "html")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
        
        let jsContext = self.webView.value(forKeyPath: "documentView.webView.mainFrame.javaScriptContext") as? JSContext
        jsContext?.setObject(JavaScriptFunc(), forKeyedSubscript: "javaScriptCallToSwift" as (NSCopying & NSObjectProtocol)!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
