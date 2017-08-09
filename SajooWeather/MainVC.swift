//
//  MainVC.swift
//  SajooWeather
//
//  Created by SajedeNouri on 5/16/1396 AP.
//  Copyright © 1396 AP SajedeNouri. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
   
    var currentWeather : CurrentWeatherClass!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did Load...")
        // Do any additional setup after loading the view, typically from a nib.
         currentWeather = CurrentWeatherGatherer().currentWeatherDownloader()
    }

    
}

