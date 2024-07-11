//
//  HomeViewModel.swift
//  App-weather-ios
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 05/07/24.
//

import UIKit

class HomeViewModel {
    private var hourlyCasts = [
        HourlyForecasts(hour: "23 C", temperature: "14 C", iconForecast: "sunIcon"),
        HourlyForecasts(hour: "23 C", temperature: "15 C", iconForecast: "sunIcon"),
        HourlyForecasts(hour: "23 C", temperature: "16 C", iconForecast: "sunIcon"),
        HourlyForecasts(hour: "23 C", temperature: "17 C", iconForecast: "sunIcon"),
        HourlyForecasts(hour: "23 C", temperature: "18 C", iconForecast: "sunIcon"),
        HourlyForecasts(hour: "23 C", temperature: "19 C", iconForecast: "sunIcon"),
        HourlyForecasts(hour: "23 C", temperature: "20 C", iconForecast: "sunIcon"),
        HourlyForecasts(hour: "23 C", temperature: "21 C", iconForecast: "sunIcon"),
        HourlyForecasts(hour: "23 C", temperature: "22 C", iconForecast: "sunIcon"),
        HourlyForecasts(hour: "23 C", temperature: "23 C", iconForecast: "sunIcon"),
    ]
    
    public var getListHourly: [HourlyForecasts] {
        hourlyCasts
    }
    
    public var numberOfItems: Int {
        1
    }
}
