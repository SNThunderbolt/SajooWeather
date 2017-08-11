//
//  Constants.swift
//  SajooWeather
// 
//  Created by SajedeNouri on 5/14/1396 AP.
//  Copyright © 1396 AP SajedeNouri. All rights reserved.
//

import Foundation

let baseURL = "http://api.apixu.com/v1/forecast.json?key="
let key = "5d2a2b99dad14d1092b151927170408"
let queryStatement = "&q="

var lat : Float = 35.74
var long : Float = 51.46
var queryValue = "\(lat),\(long)"

let daysStatement = "&days="

private var daysValue : Int = 7


//typealias  FinishedDownload = (Bool) -> (Void)

var reqURL = baseURL + key + queryStatement + queryValue + daysStatement + "\(daysValue)"

