//
//  ViewController.swift
//  PageControl_Traning
//
//  Created by jung on 2022/01/04.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lblNumber: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = 10
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.darkGray
    }

    @IBAction func PageChange(_ sender: UIPageControl) {
        lblNumber.text = String(pageControl.currentPage + 1)
    }
    
}

