//
//  InfoWeatherViewModel.swift
//  App-weather-ios
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 06/08/24.
//

import UIKit

protocol InfoWeatherViewModelProtocol {
    var titleTemperature: String { get }
    var titleEvent: String { get }
    var weatherTitle: String { get }
}

class InfoWeatherViewModel: InfoWeatherViewModelProtocol {
    var titleTemperature: String {
        return "24°C"
    }
    
    var titleEvent: String {
        return "Sol"
    }
    
    var weatherTitle: String {
        return "H: 13°C | L: 15°C"
    }
}
