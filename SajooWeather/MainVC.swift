//
//  MainVC.swift
//  SajooWeather
//
//  Created by SajedeNouri on 5/16/1396 AP.
//  Copyright © 1396 AP SajedeNouri. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentLocationLabel: UILabel!
    @IBOutlet weak var currentWeatherStatusLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var currentDateLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var currentWeather = CurrentWeatherGatherer()
    var forecastedWeather = ForecastDataGatherer()
    var forecastedData = [ForecastWeatherClass]()
    public var hasForcasted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did Load...")
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        
        currentWeather.currentWeatherDownloader() { (isDone, data) -> Void in

            if !isDone {
                print("در حال تبادل اطلاعات از سرور")
                print("خطا در اتصال به سرور")
            } else {
                print("finally finished downloading")
                if let currentWeatherData = data as? CurrentWeatherClass {
                    self.updateUIWithCurrentWeatherData (currentWeatherData: currentWeatherData)
                }
            }
        }
        
        forecastedWeather.forecastWeatherDownloader { (isFinished, fData) in
            if isFinished {
                print("Forecast completed")
                if let forecastedTmpData = fData as? [ForecastWeatherClass] {
                    self.forecastedData = forecastedTmpData
                    print("\(self.forecastedData[0].forecastWeatherStatus)")
                    self.hasForcasted = true
                    print("\(self.hasForcasted)")
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func updateUIWithCurrentWeatherData (currentWeatherData: CurrentWeatherClass) {
        self.currentLocationLabel.text = currentWeatherData.currentCity + "، " + currentWeatherData.currentCountry
        self.currentWeatherStatusLabel.text = currentWeatherData.currentStatus
        self.currentTempLabel.text = currentWeatherData.currentTemp + "°C"
        self.currentDateLabel.text = currentWeatherData.currentDate
        self.currentWeatherImage.image = UIImage(named: currentWeatherData.currentStatusTag)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        //print("numberofRowsFunctionCalled")
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       //print("numberOfRowsInSectionCalled")
        return forecastedData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            let forecastTmp = forecastedData[indexPath.row]
            cell.updateForecastWeatherCell(forecastWeatherData: forecastTmp)
            return cell
            
            
        } else {
            print("Going empty")
            return UITableViewCell()
        }
        
    }
}
