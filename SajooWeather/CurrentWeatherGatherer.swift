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
    private var _currentWeather: CurrentWeatherClass!
    
    var currentWeather: CurrentWeatherClass {
      get{
            return _currentWeather
        } set {
            _currentWeather = newValue
        }
    }
    
  
    private var cityName, countryName, temp, status : String!
    
    func currentWeatherDownloader (completed: FinishedDownload) -> (CurrentWeatherClass){
        
        let weatherURL = URL(string: url)
        
        Alamofire.request(weatherURL!).responseJSON {response in
            let result = response.result
            print("This is the result \(result)")
            if let dict = result.value as? Dictionary<String, Any> {
                if let location = dict["location"] as? Dictionary<String, Any> {
                    if let city = location["name"] as? String {
                        self.cityName = city
                        print(city)
                    }
                    if let country = location["country"] as? String {
                        self.countryName = country
                        print(country)
                    }
                }
                if let current = dict["current"] as? Dictionary<String, Any> {
                    if let temp_c = current["temp_c"] as? Int {
                        self.temp = "\(temp_c)"
                        print("\(temp_c)")
                    }
                    if let condition = current["condition"] as? Dictionary<String,Any> {
                        if let text = condition["text"] as? String {
                            self.status = text
                            print(text)
                        }
                        //another if let for your image icon tag
                    }
                }
                 self.currentWeather = CurrentWeatherClass(currentTemp: self.temp, currentStatus: self.status, currentStatusTag: 0, currentCity: self.cityName, currentCountry: self.countryName)
            }
            else {
                 self.currentWeather = CurrentWeatherClass(currentTemp: "خطا", currentStatus: "خطا", currentStatusTag: 0, currentCity: "خطا", currentCountry: "خطا")
            }
        }
        completed()
        return currentWeather
    }
    
    
}
