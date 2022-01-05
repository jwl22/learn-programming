//
//  ViewController.swift
//  HelloWorld
//
//  Created by jung on 2021/12/27.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var iblHello: UILabel!
    @IBOutlet var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSend(_ sender: UIButton) {
        iblHello.text = "Hello, " + txtName.text!
    }
    
}

