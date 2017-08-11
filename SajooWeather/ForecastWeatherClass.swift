//
//  ForecastWeatherClass.swift
//  SajooWeather
//
//  Created by SajedeNouri on 5/19/1396 AP.
//  Copyright © 1396 AP SajedeNouri. All rights reserved.
//

import Foundation

class ForecastWeatherClass {
    
    private var _forecastDate: String!
    private var _forecastMinTemp: String!
    private var _forecastMaxTemp: String!
    private var _forecastWeatherStatus: String!
    private var _forecastWeatherIconTag: String!
    
    var forecastDate: String {
        if _forecastDate == nil {
            _forecastDate  = ""
        }
        return _forecastDate
    }
    
    var forecastMinTemp: String {
        if _forecastMinTemp == nil {
            _forecastMinTemp = ""
        }
        return _forecastMinTemp
    }
    
    var forecstMaxTemp: String {
        if _forecastMaxTemp == nil {
            _forecastMaxTemp = ""
        }
        return _forecastMaxTemp
    }
    
    var forecastWeatherStatus: String {
        if _forecastWeatherStatus == nil {
            _forecastWeatherStatus = ""
        }
        return _forecastWeatherStatus
    }
    
    var forecastWeatherIconTag: String {
        if _forecastWeatherIconTag == nil {
            _forecastWeatherIconTag = ""
        }
        return _forecastWeatherIconTag
    }
    
    init (forecastDate: String, forecastMinTemp: String, forecastMaxTemp: String, forecastWeatherStatus: String, forecastWeatherIconTag: String) {
        _forecastDate = forecastDate
        _forecastMinTemp = forecastMinTemp
        _forecastMaxTemp = forecastMaxTemp
        _forecastWeatherStatus = forecastWeatherStatus
        _forecastWeatherIconTag = forecastWeatherIconTag
    }
    
}
