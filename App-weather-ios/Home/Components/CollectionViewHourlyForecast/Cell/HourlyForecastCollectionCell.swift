//
//  HourlyForecastCollectionViewCell.swift
//  App-weather-ios
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 26/06/24.
//

import UIKit

class HourlyForecastCollectionCell: UICollectionViewCell {
    static let identifier: String = "HourlyForecastCollectionCell"
    
    private let screen: HourlyForecastScreenViewCell = HourlyForecastScreenViewCell()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen(){
        screen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(screen)
        screen.setConstraintsToParent(contentView)
    }
    
    public func setupCell(data: HourlyForecasts, indexPath: IndexPath){
        screen.eventLabel.text = "Ensolarado"
        screen.temperatureLabel.text = "12° / 12°"
        screen.iconImageView.image = UIImage(named: data.iconForecast)
    }
}
