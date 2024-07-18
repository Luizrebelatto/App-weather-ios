//
//  HomeViewModel.swift
//  App-weather-ios
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 05/07/24.
//

import UIKit

class HomeViewModel {
    private var hourlyCasts = [
        HourlyForecasts(eventLabel: "Sol", temperature: "12° / 12°", iconForecast: "sunIcon"),
        HourlyForecasts(eventLabel: "Chuva", temperature: "12° / 33°", iconForecast: "sunIcon"),
        HourlyForecasts(eventLabel: "Neve", temperature: "22° / 32°", iconForecast: "sunIcon"),
        HourlyForecasts(eventLabel: "Sol", temperature: "12° / 13°", iconForecast: "sunIcon"),
        HourlyForecasts(eventLabel: "Chuva", temperature: "11° / 19°", iconForecast: "sunIcon"),
        HourlyForecasts(eventLabel: "Nublado", temperature: "12° / 12°", iconForecast: "sunIcon"),
        HourlyForecasts(eventLabel: "Temporal", temperature: "12° / 12°", iconForecast: "sunIcon"),
        HourlyForecasts(eventLabel: "Chuva", temperature: "12° / 12°", iconForecast: "sunIcon"),
        HourlyForecasts(eventLabel: "Sol", temperature: "12° / 12°", iconForecast: "sunIcon"),
        HourlyForecasts(eventLabel: "Sol", temperature: "12° / 12°", iconForecast: "sunIcon"),
    ]
    
    public var getListHourly: [HourlyForecasts] {
        hourlyCasts
    }
    
    public var numberOfItems: Int {
        1
    }
}
