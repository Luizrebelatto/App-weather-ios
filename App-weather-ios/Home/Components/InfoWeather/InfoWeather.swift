//
//  InfoWeather.swift
//  App-weather-ios
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 04/08/24.
//

import UIKit

class InfoWeather: UIStackView {
    var viewModel: InfoWeatherViewModelProtocol? {
        didSet {
            setDataBind()
        }
    }
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.blueDark
        label.font = UIFont.systemFont(ofSize: 60, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var eventLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.blueDark
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.blueDark
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var contentWeatherStackView = {
        let stackView = UIStackView(arrangedSubviews: [eventLabel, weatherLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.spacing = 4
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 10, trailing: 0)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func configStackView() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        backgroundColor = .clear
        isLayoutMarginsRelativeArrangement = true
        spacing = 4
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 10, trailing: 0)
        
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        addArrangedSubview(temperatureLabel)
        addArrangedSubview(contentWeatherStackView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            temperatureLabel.trailingAnchor.constraint(equalTo: contentWeatherStackView.leadingAnchor, constant: -20)
        ])
    }
    
    private func setDataBind() {
        guard let viewModel = viewModel else { return }
        temperatureLabel.text = viewModel.titleTemperature
        eventLabel.text = viewModel.titleEvent
        weatherLabel.text = viewModel.weatherTitle
    }
}

