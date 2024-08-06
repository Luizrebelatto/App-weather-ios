//
//  HeaderContentViewModel.swift
//  App-weather-ios
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 06/08/24.
//

import UIKit

protocol HeaderContentViewModelProtocol {
    var titleCity: String { get }
    var iconImage: UIImage { get }
}

class HeaderContentViewModel: HeaderContentViewModelProtocol {
    var titleCity: String {
        return "Porto Alegre"
    }
    
    var iconImage: UIImage {
        return UIImage.sunIconImage
    }
}
