//
//  ViewController.swift
//  ImageView_Training
//
//  Created by jung on 2021/12/27.
//

import UIKit

class ViewController: UIViewController {
    var maxImage = 6
    var numImage = 1
    
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let imageName = String(numImage) + ".png"
        imgView.image = UIImage(named: imageName)
    }

    @IBAction func btnPreviousImage(_ sender: UIButton) {
        numImage -= 1
        if(numImage < 1){
            numImage = maxImage
        }
        viewDidLoad()
    }
    @IBAction func btnNextImage(_ sender: UIButton) {
        numImage += 1
        if(numImage > maxImage){
            numImage = 1
        }
        viewDidLoad()
    }
}
