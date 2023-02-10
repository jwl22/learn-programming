//
//  ViewController.swift
//  WebApp_Github
//
//  Created by jung on 2022/03/18.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet var WKView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        WKView.load(myRequest)
    }


}

