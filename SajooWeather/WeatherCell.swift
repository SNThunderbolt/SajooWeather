//
//  WeatherCell.swift
//  SajooWeather
//
//  Created by SajedeNouri on 5/20/1396 AP.
//  Copyright © 1396 AP SajedeNouri. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var forcastStatusIconImage: UIImageView!
    @IBOutlet weak var highTempArrowImage: UIImageView!
    @IBOutlet weak var lowTempArrowImage: UIImageView!
    @IBOutlet weak var forcastHighTempLabel: UILabel!
    @IBOutlet weak var forcastLowTempLabel: UILabel!
    @IBOutlet weak var forcastDateLabel: UILabel!
    @IBOutlet weak var forcastStatusLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateForecastWeatherCell (forecastWeatherData: ForecastWeatherClass){
            //print("This is the Update Forecast Weather Cell Function.........")
            //update ui cell
            forcastStatusIconImage.image = UIImage(named: forecastWeatherData.forecastWeatherIconTag)
            highTempArrowImage.image = UIImage(named: "arrowsUp")
            lowTempArrowImage.image = UIImage(named: "arrowsDown")
            forcastHighTempLabel.text = forecastWeatherData.forecstMaxTemp + "°"
            forcastLowTempLabel.text = forecastWeatherData.forecastMinTemp + "°"
            forcastDateLabel.text = forecastWeatherData.forecastDate
                    forcastStatusLabel.text = forecastWeatherData.forecastWeatherStatus
        }

}



