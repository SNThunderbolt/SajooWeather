//
//  CurrentWeatherGatherer.swift
//  SajooWeather
//
//  Created by SajedeNouri on 5/18/1396 AP.
//  Copyright © 1396 AP SajedeNouri. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeatherGatherer {
    
    
    private var url : String = reqURL
  
    private var cityName, countryName, temp, status : String!
    
    
    func currentWeatherDownloader (completed: @escaping (Bool, Any) -> Void) {
        var iconCode = ""
        let weatherURL = URL(string: url)
        var res : String = ""
        Alamofire.request(weatherURL!).responseJSON {response in
            let result = response.result
            res = "\(result)"
          //  print("This is the res " + res)
            if let dict = result.value as? Dictionary<String, Any> {
                if let location = dict["location"] as? Dictionary<String, Any> {
                    if let city = location["region"] as? String {
                        self.cityName = city
                       // print(city)
                    }
                    if let country = location["country"] as? String {
                        self.countryName = country
                      //  print(country)
                    }
                }
                if let current = dict["current"] as? Dictionary<String, Any> {
                    if let temp_c = current["temp_c"] as? Int {
                        self.temp = "\(temp_c)"
                      //  print("\(temp_c)")
                    }
                    if let condition = current["condition"] as? Dictionary<String,Any> {
                        if let text = condition["text"] as? String {
                            self.status = text
                            //print(text)
                        }
                        if let code = condition["icon"] as? String {
                            
                            let firstSeparate = code.components(separatedBy: "/")
                            let firstCount = firstSeparate.count
                            let lastPart = firstSeparate[firstCount-1].components(separatedBy: ".")[0]
                          
                                iconCode = lastPart
                               // print(iconCode)
                        }
                    }
                }
            }
            
             if (res == "SUCCESS") {
                let currentWeatherData = CurrentWeatherClass(currentTemp: self.temp, currentStatus: self.status, currentStatusTag: iconCode, currentCity: self.cityName, currentCountry: self.countryName)
                completed(true, currentWeatherData)
            } else {
                    let currentWeatherData = CurrentWeatherClass.init(currentTemp: "خطا", currentStatus: "خطا", currentStatusTag: "خطا", currentCity: "خطا", currentCountry: "خطا")
                print("printing res one more time \(res)")
                completed(false, currentWeatherData)
            }
            
        }
       
        
        
    }
    
    
}
