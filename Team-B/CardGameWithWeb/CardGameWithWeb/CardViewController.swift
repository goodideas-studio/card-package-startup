import UIKit
import JavaScriptCore

@objc protocol JavaScriptFuncProtocol: JSExport {
    func saveData(_ character: Int, _ background: Int, _ conis: Int)
//    func saveData(_ character: String, _ background: String)
}

class JavaScriptFunc : NSObject, JavaScriptFuncProtocol {
    
//    func saveData(_ character: String, _ background: String) {
//        print("OK")
//    }
    
    func saveData(_ character: Int, _ background: Int, _ coins: Int) {
        print("OK")
        
        
        
        UserDefaults.standard.setValue(String(coins), forKey: "coins")
        
        let drawInfo = ["character": String(character), "background": "cardBackground0\(background+1)"]
//        print(drawInfo)
        var cardLists : [[String:String]] = UserDefaults.standard.array(forKey: "record") as? [[String : String]] == nil ? [] : UserDefaults.standard.array(forKey: "record") as! [[String : String]]
        
        cardLists.append(drawInfo)
        UserDefaults.standard.setValue(cardLists, forKey: "record")
    }
    
    func returnCoins() -> Int {
        
        return UserDefaults.standard.integer(forKey: "coins")
        
    }
    
}

class CardViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var mainWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "index_v2", withExtension: "html")
        let request = URLRequest(url: url!)
        mainWebView.loadRequest(request)
        
                let jsContext = self.mainWebView.value(forKeyPath: "documentView.webView.mainFrame.javaScriptContext") as? JSContext
                jsContext?.setObject(JavaScriptFunc(), forKeyedSubscript: "javaScriptCallToSwift" as (NSCopying & NSObjectProtocol)!)
        
        
//       let fun = JavaScriptFunc()
////        fun.saveData("0", background: "2", conis: "5000")
//        print(fun.returnCoins())
        
    }
}
