//
//  CurrentWeatherClass.swift
//  SajooWeather
//
//  Created by SajedeNouri on 5/18/1396 AP.
//  Copyright © 1396 AP SajedeNouri. All rights reserved.
//

import Foundation

class CurrentWeatherClass {
    private var _currentDate: String!
    private var _currentTemp: String!
    private var _currentStatus: String!
    private var _currentStatusTag: Int!
    private var _currentCity: String!
    private var _currentCountry: String!
    private var _temporaryDate: String!
    
    

    var currentDate: String {
//        if _currentDate == nil {
//            _currentDate = ""
//        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let _temporaryDate = dateFormatter.string(from: Date())
        self._currentDate = "امروز‌‌ء \(_temporaryDate)"
        return _currentDate
    }
    
    var currentTemp: String {
//        if _currentTemp == nil {
//            _currentTemp = ""
//        }
        return _currentTemp
    }
    
    var currentStatus: String {
//        if _currentStatus == nil{
//            _currentStatus = ""
//        }
        return _currentStatus
    }
    
    var currentStatusTag: Int {
//        if _currentStatusTag == nil {
//            _currentStatusTag = 0
//        }
        return _currentStatusTag
    }
    
    var currentCity: String {
//        if _currentCity == nil {
//            _currentCity = ""
//        }
        return _currentCity
    }
    
    var currentCountry: String {
//        if _currentCountry == nil {
//            _currentCountry = ""
//        }
        return _currentCountry
    }
    
    
    init(currentTemp: String, currentStatus: String, currentStatusTag: Int, currentCity: String, currentCountry: String) {
        _currentTemp = currentTemp
        _currentStatus = currentStatus
        _currentStatusTag = currentStatusTag
        _currentCity = currentCity
        _currentCountry = currentCountry
    }
}
