//
//  Service.swift
//  App-weather-ios
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 14/08/24.
//

import Foundation

class Service {
    private let baseURL: String = "https://api.weatherapi.com/v1"
    private let apiKey: String = "07b2d35c45724ac9b84110522241908"

    private let session = URLSession.shared
    
    func currentWeatherData(city: String, _ completion: @escaping (currentWeatherResponse?) -> Void) {
        let urlString = "\(baseURL)/current.json?q=\(city)&key=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Erro de rede: \(error?.localizedDescription ?? "desconhecido")")
                completion(nil)
                return
            }
            
            do {
                let forecastResponse = try JSONDecoder().decode(currentWeatherResponse.self, from: data)
                completion(forecastResponse)
            } catch {
                print("error: ", error)
                completion(nil)
            }
        }
        
        task.resume()
    }
}
