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

private var daysValue : Int = 8


//typealias  FinishedDownload = (Bool) -> (Void)

var reqURL = baseURL + key + queryStatement + queryValue + daysStatement + "\(daysValue)"

let weekTranslation = ["Saturday":"شنبه", "Sunday":"یک‌شنبه", "Monday":"دوشنبه", "Tuesday":"سه‌شنبه", "Wednesday":"چهارشنبه", "Thursday":"پنج‌شنبه", "Friday":"جمعه"]

let weatherStatusTranslation = ["Sunny":"آفتابی", "Cloudy":"ابری", "Partly cloudy":"کمی تا قسمتی ابری", "Overcast":"ابری", "Mist":"غبارآلود", "Patchy rain possible":"بارش پراکنده", "Patchy snow possible":"بارش پراکنده ابر", "Patchy sleet possible":"بارش پراکنده تگرگ", "Patchy freezing drizzle possible":"احتمال بارش پراکنده", "Thundery outbreaks possible":"رعد و برق پراکنده"]
let cityTranslation = ["Tehran":"تهران", "Isfahan":"اصفهان"]
let countryTranslation = ["Iran":"ایران"]
