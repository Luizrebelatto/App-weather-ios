//
//  HomeScreen.swift
//  App-weather-ios
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 01/07/24.
//

import UIKit

class HomeScreen: UIView {
    private lazy var backgroundView: UIImageView = {
        let imageBackground = UIImageView(frame: .zero)
        imageBackground.translatesAutoresizingMaskIntoConstraints = false
        imageBackground.contentMode = .scaleAspectFill
        imageBackground.image = UIImage.backgroundImage
        return imageBackground
    }()
    
    private lazy var headerView: UIView = {
        let header = UIView(frame: .zero)
        header.translatesAutoresizingMaskIntoConstraints = false
        header.backgroundColor = UIColor.lightColor
        header.clipsToBounds = true
        header.layer.cornerRadius = 20
        return header
    }()
    
    private lazy var humidityLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Umidade"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.lightColor
        return label
    }()
    
    private lazy var humidityLabelValue: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1000mm"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.lightColor
        return label
    }()
    
    private lazy var humidityStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [humidityLabel, humidityLabelValue])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var windLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Vento"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.lightColor
        return label
    }()
    
    private lazy var windLabelValue: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10km/h"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.lightColor
        return label
    }()
    
    private lazy var windStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [windLabel, windLabelValue])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
   
    private lazy var statsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [humidityStackView, windStackView])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 3
        stackView.backgroundColor = UIColor.softGrayColor
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
        return stackView
    }()
    
    private lazy var hourlyForecastLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Previsão Por Hora"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.lightColor
        label.textAlignment = .center
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 67, height: 84)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(HourlyForecastCardCollectionViewCell.self, forCellWithReuseIdentifier: HourlyForecastCardCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundView)
        backgroundView.addSubview(headerView)
        backgroundView.addSubview(statsStackView)
        backgroundView.addSubview(hourlyForecastLabel)
        addSubview(collectionView)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configProtocolsColletionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource){
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            headerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -35),
            headerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 35),
            headerView.heightAnchor.constraint(equalToConstant: 169)
        ])
        
        NSLayoutConstraint.activate([
            statsStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24),
            statsStackView.widthAnchor.constraint(equalToConstant: 206),
            statsStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            hourlyForecastLabel.topAnchor.constraint(equalTo: statsStackView.bottomAnchor, constant: 29),
            hourlyForecastLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -35),
            hourlyForecastLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 35)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: hourlyForecastLabel.bottomAnchor, constant: 35),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
