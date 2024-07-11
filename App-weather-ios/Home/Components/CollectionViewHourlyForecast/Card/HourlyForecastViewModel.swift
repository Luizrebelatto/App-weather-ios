//
//  HourlyForecastViewModel.swift
//  App-weather-ios
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 26/06/24.
//

import UIKit

class HourlyForecastViewModel {
    
    private var listHourlyForecast: [HourlyForecasts]
    
    init(listHourlyForecast: [HourlyForecasts]) {
        self.listHourlyForecast = listHourlyForecast
    }
    
    public var numberOfItems: Int {
        listHourlyForecast.count
    }
    
    func loudCurrentHourlyForecast(indexPath: IndexPath) -> HourlyForecasts {
        listHourlyForecast[indexPath.row]
    }
}

