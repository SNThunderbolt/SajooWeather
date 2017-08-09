//
//  MainVC.swift
//  SajooWeather
//
//  Created by SajedeNouri on 5/16/1396 AP.
//  Copyright © 1396 AP SajedeNouri. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
   
    var currentWeather = CurrentWeatherGatherer()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did Load...")
        // Do any additional setup after loading the view, typically from a nib.
        currentWeather.currentWeatherDownloader() { (isDone) -> Void in
            if isDone {
                print("Appearantly finished downloading and should print currect values..")
            }
            else {
                print("Still waiting to fetch data")
            }
            
        }
        
    }

}
