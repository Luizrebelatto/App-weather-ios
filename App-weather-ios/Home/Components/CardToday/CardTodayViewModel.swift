//
//  CardTodayViewModel.swift
//  App-weather-ios
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 18/07/24.
//

import UIKit

protocol CardTodayViewModelProtocol {
    var titleText: String { get }
    var weatherText: String { get }
    var temperatureText: String { get }
    var iconImage: UIImage { get }
}

class CardTodayViewModel: CardTodayViewModelProtocol {
    var titleText: String {
        return "Today"
    }
    
    var weatherText: String {
        return "Sol"
    }
    
    var temperatureText: String {
            return "26º / 30º"
        }
        
    var iconImage: UIImage {
        return UIImage.sunIcon
    }
}
