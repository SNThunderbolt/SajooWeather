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
    private var _currentStatusTag: String!
    private var _currentCity: String!
    private var _currentCountry: String!
    private var _temporaryDate: String!
    
    

    var currentDate: String {
        if _currentDate == nil {
            _currentDate = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let _temporaryDate = dateFormatter.string(from: Date())
        self._currentDate = "\(_temporaryDate)"
        return _currentDate
    }
    
    var currentTemp: String {
        if _currentTemp == nil {
            _currentTemp = ""
        }
        return _currentTemp
    }
    
    var currentStatus: String {
        if _currentStatus == nil{
            _currentStatus = ""
        }
        return _currentStatus
    }
    
    var currentStatusTag: String {
        if _currentStatusTag == nil {
            _currentStatusTag = ""
        }
        return _currentStatusTag
    }
    
    var currentCity: String {
        if _currentCity == nil {
            _currentCity = ""
        }
        return _currentCity
    }
    
    var currentCountry: String {
        if _currentCountry == nil {
            _currentCountry = ""
        }
        return _currentCountry
    }
    
    
    init(currentTemp: String, currentStatus: String, currentStatusTag: String, currentCity: String, currentCountry: String) {
        _currentTemp = currentTemp
        _currentStatus = currentStatus
        _currentStatusTag = currentStatusTag
        _currentCity = currentCity
        _currentCountry = currentCountry
    }
}
