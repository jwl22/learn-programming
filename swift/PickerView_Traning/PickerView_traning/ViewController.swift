//
//  ViewController.swift
//  PickerView_traning
//
//  Created by jung on 2021/12/28.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let numOfImage = 10
    let numOfColumn = 2
    let heightOfRow = 80.0
    var imageArray = [UIImage?]()
    var imageFileName = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"]
    
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0 ..< numOfImage{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        lblImageName.text = imageFileName[0]
        imageView.image = imageArray[0]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return numOfColumn
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return heightOfRow
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 80)
        
        return imageView
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            lblImageName.text = imageFileName[row]
        }
        else{
            imageView.image = imageArray[row]
        }
    }
}

