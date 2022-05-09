//
//  ViewController.swift
//  WebView
//
//  Created by Ouriel Bennathan on 03/05/2022.
//

import UIKit
import WebKit
import SafariServices
class ViewController: UIViewController {
      
    @IBOutlet weak var myWebView: WKWebView!
    let students = ["Eias","Eran","Gal","Mousa","Avi","Ran","Rimon","Daniel","Mike"]
    override func viewDidLoad() {
        super.viewDidLoad()
        webByCode()
    }
    
    @IBAction func sgmtOption(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
                case 0:  //local
                    print ("local")
                    webByCode()
                case 1: //files
                    print ("files")
                    webByFiles()
                case 2: //local  web kit
                    print ("web kit")
                    webWithWebView()
                case 3: //safari
                    print ("safari")
                    loadSafari()
                default:
                    print ("error")
                }
    }
    fileprivate func webByCode(){
            var html = "<h1>Alian Options for grooms</h1>"
            html += "<ul>"
            for singleItem in students {
                html += "<li>\(singleItem)</li>"
            }
            html += "</ul>"
            myWebView.loadHTMLString(html, baseURL: nil)
        }
        
        fileprivate func webByFiles(){
            let path = Bundle.main.path(forResource: "index", ofType: "html")!
            let myURL = URL(fileURLWithPath: path)
            myWebView.load(URLRequest(url: myURL)) //by request of daniel.
        }
        
        fileprivate func webWithWebView(){
            print ("loading outside url")
            myWebView.load(URLRequest(url: URL(string: "https://www.paypal.com/il/signin")!))
        }
        
        fileprivate func loadSafari(){
            let url = URL(string: "https://www.hackeru.co.il")!
            let vc = SFSafariViewController(url: url)
            present(vc,animated: true,completion: nil)
        }

}

