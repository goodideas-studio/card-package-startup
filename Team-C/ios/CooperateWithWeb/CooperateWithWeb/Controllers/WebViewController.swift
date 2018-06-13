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
    func updateMoney(money:Int)
    func updateCardList(_ result:String)
}

class JavaScriptFunc:NSObject, JavaScriptFuncProtcol{
    
    func updateCardList(_ result:String){
        UserDefaults.standard.setValue(result, forKey: "resultJSON")
        print(result)
        
    }
    
    func updateMoney(money: Int) {
        UserDefaults.standard.set(money, forKey: "remainingMoney")
    }    
    
    
    
}

class WebViewController: UIViewController, UIWebViewDelegate{
    
    var jsonDataFromWebView:String?
    var remainingMoney:Int?
    
    @IBOutlet weak var webView: UIWebView!
    
    func getMoney()->Int{
        return UserDefaults.standard.integer(forKey: "remainingMoney")
    }
    
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
