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
        print(character)
        print(background)
        print(coins)
        var value = 0
        switch background {
        case 0:
            value = 1
        case 1:
            value = 5
        case 2:
            value = 4
        case 3:
            value = 3
        default:
            value = 2
        }
        
        UserDefaults.standard.setValue(String(coins), forKey: "coins")
        
        let drawInfo = ["character": String(character), "background": "cardBackground0\(value)"]
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
