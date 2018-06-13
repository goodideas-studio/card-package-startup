import UIKit
import JavaScriptCore

@objc protocol JavaScriptFuncProtocol: JSExport {
    func test(_ value: String)
//    func test2(_ value: String, _ num: Int)
}

class JavaScriptFunc : NSObject, JavaScriptFuncProtocol {
    func test(_ value: String) {
        print("value: \(value)")
    }
}

class CardViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var mainWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "index_v2", withExtension: "html")
        let request = URLRequest(url: url!)
        mainWebView.loadRequest(request)
        
        let jsContext = mainWebView.value(forKeyPath: "documentView.webView.mainFrame.javaScriptContext") as? JSContext
        jsContext?.setObject(JavaScriptFunc(), forKeyedSubscript: "javaScriptCallToSwift" as (NSCopying & NSObjectProtocol)!)

        
        
        let context: JSContext = JSContext()
        
        context.evaluateScript("var num1 = 10; var num2 = 20;")
        
        let result: JSValue = context.evaluateScript("add(num1, num2)")
        print("result: \(result)") // 30
        
    }
}
