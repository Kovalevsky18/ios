//
//  ViewController.swift
//  WeatherAlamo
//
//  Created by Родион Ковалевский on 3/28/19.
//  Copyright © 2019 Родион Ковалевский. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation
import FLAnimatedImage
class ViewController: UIViewController , CLLocationManagerDelegate{
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var weatherRepresentation: UILabel!
    @IBOutlet weak var temp: UILabel!
    let gradientLayer = CAGradientLayer()
    let key = "358c22a98d900433c8d1b8e1d6f9c017"
    var latitude = 53.9000
    var longitude = 27.5667
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        latitude = location.coordinate.latitude
        longitude = location.coordinate.longitude
        print(latitude)
        print(longitude)
        Alamofire.request("http://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(key)&units=metric").responseJSON {
            response in
            if let responseStr = response.result.value {
                let jsonResponse = JSON(responseStr)
                let jsonWeather = jsonResponse["weather"].array![0]
                let jsonTemp = jsonResponse["main"]
                let iconName = jsonWeather["icon"].stringValue
                self.cityName.text = jsonResponse["name"].stringValue
                self.imageView.image = UIImage(named: iconName)
                self.weatherRepresentation.text = jsonWeather["main"].stringValue
                self.temp.text = "\(Double(jsonTemp["temp"].doubleValue))"
                
                let date = Date()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "EEEE"
                self.day.text = dateFormatter.string(from: date)
                
                let suffix = iconName.suffix(1)
                if(suffix == "d"){
                    self.setColor()
                }else{
                    self.defaultColor()
                }
            }
        }
        self.locationManager.stopUpdatingLocation()

    }
    
    func setColor(){
        backgroundImageView.image = #imageLiteral(resourceName: "1.jpg")
    }
    func defaultColor(){
        backgroundImageView.image = #imageLiteral(resourceName: "12.jpg")
    }
    
    
    }

