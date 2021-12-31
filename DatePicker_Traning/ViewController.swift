//
//  ViewController.swift
//  DatePicker_Traning
//
//  Created by jung on 2021/12/28.
//

import UIKit

class ViewController: UIViewController {
    let interval = 1.0
    let timeSelector: Selector = #selector(ViewController.updateTime)
    var count = 0
    
    var pickerTime: String?
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        print(123)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePicker = sender
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택시간: " + formatter.string(from: datePicker.date)
        
        formatter.dateFormat = "HH:mm"
        pickerTime = formatter.string(from: datePicker.date)
    }
    
    @objc func updateTime(){
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
        
        formatter.dateFormat = "HH:mm"
        let currentTime = formatter.string(from: date as Date)
        
        if pickerTime == currentTime{
            view.backgroundColor = UIColor.red
        }
        else{
            view.backgroundColor = UIColor.white
        }
    }
}

