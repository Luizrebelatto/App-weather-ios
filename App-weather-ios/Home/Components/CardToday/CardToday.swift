//
//  CardToday.swift
//  App-weather-ios
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 18/07/24.
//

import UIKit

class CardToday: UIStackView {
    private lazy var titleCard: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.blueDark
        label.text = "Today"
        label.textAlignment = .center
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var weatherTitleValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.blueDark
        label.text = "26º / 30º"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var weatherTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.blueDark
        label.text = "Chuva"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var weatherIconCard: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage.sunIconImage
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configStackView()
        setHierarchy()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configStackView(){
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        backgroundColor = UIColor.opacityBlueCard
        isLayoutMarginsRelativeArrangement = true
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 10, trailing: 0)
        spacing = 2
        clipsToBounds = true
        layer.cornerRadius = 20
        
        NSLayoutConstraint.activate([
            weatherIconCard.heightAnchor.constraint(equalToConstant: 50),
            weatherIconCard.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func setHierarchy(){
        addArrangedSubview(titleCard)
        addArrangedSubview(weatherIconCard)
        addArrangedSubview(weatherTitleValue)
        addArrangedSubview(weatherTitle)
    }
}
