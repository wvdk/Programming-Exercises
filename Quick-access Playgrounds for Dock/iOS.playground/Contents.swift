
import UIKit

let webView = UIWebView(frame: CGRect(x: 0, y: 0, width: 600, height: 600))

let request = NSURLRequest(URL: NSURL(string: "http://nshipster.com/nsurlprotocol/")!)

webView.loadRequest(request)


 