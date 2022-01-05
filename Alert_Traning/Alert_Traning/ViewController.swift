//
//  ViewController.swift
//  Alert_Traning
//
//  Created by jung on 2021/12/29.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var selectedTime: String?
    var alreadySame = false
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblSelectTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy:MM:dd HH:mm EEE"
        lblSelectTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
        
        formatter.dateFormat = "HH:mm EEE"
        selectedTime = formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime(){
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
        
        formatter.dateFormat = "HH:mm EEE"
        if alreadySame && selectedTime != formatter.string(from: date as Date){
            alreadySame = false
        }
        if (selectedTime == formatter.string(from: date as Date)) && !alreadySame {
            let sameTimeAlert = UIAlertController(title: "알림", message: "설정된 시간입니다!!!", preferredStyle: UIAlertController.Style.alert)
            let sameTimeAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            alreadySame = true
            
            sameTimeAlert.addAction(sameTimeAction)
            present(sameTimeAlert, animated: true, completion: nil)
        }
    }
    
}

