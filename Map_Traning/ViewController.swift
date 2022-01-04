//
//  ViewController.swift
//  Map_Traning
//
//  Created by jung on 2022/01/03.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager() //로케이션메니저 함수 호출 및 저장
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //정확도 최고로
        locationManager.requestWhenInUseAuthorization() //위치 추적 허가 요청
        locationManager.startUpdatingLocation() //위치업데이트
        myMap.showsUserLocation = true //위치 표시
    }
    
    //해당 위치로 이동 및 위치반환
    func goLocation(latitudeValude: CLLocationDegrees, longtitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D{ //찾은 위치를 저장하기 위해 coordinate반환
        let pLocation = CLLocationCoordinate2DMake(latitudeValude, longtitudeValue) //좌표로 위치 저장
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span) //위치 기반으로 span값 저장
        let pRagion = MKCoordinateRegion(center: pLocation, span: spanValue) //좌표 및 span값으로 지역 탐색
        myMap.setRegion(pRagion, animated: true) //지도 위치 설정
        return pLocation
    }
    
    //위치 생성
    func setAnnotation(latitudeValue: CLLocationDegrees, longtitudeValue: CLLocationDegrees, delta :Double, title: String, subtitle: String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValude: latitudeValue, longtitudeValue: longtitudeValue, delta: delta)
        annotation.title = title
        annotation.subtitle = subtitle
        myMap.addAnnotation(annotation)
    }
    
    //locationManager 함수 선언부분. 이부분은 더 공부해야함
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last //마지막 위치 저장(업데이트)
        _ = goLocation(latitudeValude: (pLocation?.coordinate.latitude)!, longtitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01) //저장한 위치로 이동
        
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil{
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil{
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        })
        
        locationManager.stopUpdatingLocation()
    }

    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
        }
        else if sender.selectedSegmentIndex == 1 {
            setAnnotation(latitudeValue: 37.57661198870325, longtitudeValue: 126.97694103003671, delta: 0.1, title: "광화문", subtitle: "서울특별시 종로구 세종로 사직로 161")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "광화문"
        }
        else if sender.selectedSegmentIndex == 2 {
            setAnnotation(latitudeValue: 37.55224855402037, longtitudeValue: 126.98830971204556, delta: 0.1, title: "남산타워", subtitle: "서울특별시 용산구 남산공원길 105")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "남산타워"
        }
        else if sender.selectedSegmentIndex == 3 {
            setAnnotation(latitudeValue: 37.33479732987658, longtitudeValue: -122.00891835720294, delta: 0.1, title: "Apple Park", subtitle: "One Apple Park Way, Cupertino, CA 95014")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "Apple Park"
        }
    }
    
}

