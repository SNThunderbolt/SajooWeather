//
//  ForecastDataGatherer.swift
//  SajooWeather
//
//  Created by SajedeNouri on 5/19/1396 AP.
//  Copyright © 1396 AP SajedeNouri. All rights reserved.
//

import Foundation
import Alamofire

class ForecastDataGatherer {
    private var url : String = reqURL
    
    func forecastWeatherDownloader (completed: @escaping (Bool, Any) -> Void) {
        //-----------------------------------------
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "EEEE"
        let persianCalendar = Calendar(identifier: .persian)
        dateFormatter.calendar = persianCalendar
        let pDate = Date()
        let dateInPersian = dateFormatter.string(from: pDate)
    
        print(dateInPersian)
        //self._currentDate = dateInPersian
        //-----------------------------------------
        let weatherURL = URL(string: url)
        var res : String = ""
        var date, highTemp, lowTemp, status, iconTag : String!
        var forecastData = [ForecastWeatherClass]()
        var forecastTmp : ForecastWeatherClass!
        
        Alamofire.request(weatherURL!).responseJSON {response in
            let result = response.result
            res = "\(result)"
            print("This is the forcasted res " + res)
            if let dict = result.value as? Dictionary<String, Any> {
                if let forecast = dict["forecast"] as? Dictionary<String, Any> {
                    if let forecastday = forecast["forecastday"] as? [Dictionary<String, Any>] {
                        for i in 1 ... forecastday.count-1 {
                            //print("\(i)")
                            if let fDate =  forecastday[i]["date"] as? String {
                                
                                //--------- setting day of week --------------
                                let tmp = persianCalendar.date(byAdding: .day, value: +i, to: pDate)
                                let dayOfWeek = dateFormatter.string(from: tmp!)
                                print(dayOfWeek)
                                //---------------------------------------------
                                date = weekTranslation["\(dayOfWeek)"]
                                
                                if let day = forecastday[i]["day"] as? Dictionary<String, Any > {
                                    if let hTemp = day["maxtemp_c"] as? Int {
                                        highTemp = "\(hTemp)"
                                    }
                                    if let lTemp = day["mintemp_c"] as? Int {
                                        lowTemp = "\(lTemp)"
                                    }
                                    if let condition = day["condition"] as? Dictionary<String, Any> {
                                        
                                        if let st = condition["text"] as? String {
                                            status = st
                                            //print("forcasted status\(status!)")
                                        }
                                        
                                        if let icon = condition["icon"] as? String {
                                            let firstSeparate = icon.components(separatedBy: "/")
                                            let firstSparateCount = firstSeparate.count
                                            iconTag = firstSeparate[firstSparateCount-1].components(separatedBy: ".")[0]
                                        }
                                    }
                                    if (res == "SUCCESS") {
                                        forecastTmp = ForecastWeatherClass(forecastDate: date, forecastMinTemp: lowTemp, forecastMaxTemp: highTemp, forecastWeatherStatus: status, forecastWeatherIconTag: iconTag)
                                        if forecastTmp != nil {
                                            forecastData.append(forecastTmp)
                                            //print ("This is array of forcasted data with \(forecastData.count) elements...")
                                        }
                                    } else {
                                        forecastTmp = ForecastWeatherClass(forecastDate: "خطا", forecastMinTemp: "خطا", forecastMaxTemp: "خطا", forecastWeatherStatus: "خطا", forecastWeatherIconTag: "خطا")
                                    }
                                }
                            }
                        }
                    }
                    
                }
                }
                
        if (res == "SUCCESS") {
            completed(true, forecastData)
            
        } else {
            completed(false, forecastData)
            
        }
    }
}
}
