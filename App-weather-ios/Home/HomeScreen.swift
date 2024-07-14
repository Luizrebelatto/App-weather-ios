//
//  HomeScreen.swift
//  App-weather-ios
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 01/07/24.
//

import UIKit

class HomeScreen: UIView {
    private lazy var headerView: UIView = {
        let header = HeaderViewScreen(frame: .zero)
        return header
    }()
    
    private lazy var statsStackView: UIStackView = {
        let stackView = CardInfoViewScreen(frame: .zero)
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
    
    private lazy var dailyForecastLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "PROXIMOS DIAS"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.lightColor
        label.textAlignment = .center
        return label
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Porto Alegre"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = UIColor.blueDark
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setHierarchy()
//        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configProtocolsColletionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource){
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    private func setHierarchy() {
//        addSubview(backgroundView)
        backgroundColor = .softBlue
        addSubview(cityLabel)
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            cityLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
        
        
//        backgroundView.addSubview(headerView)
//        backgroundView.addSubview(statsStackView)
//        backgroundView.addSubview(hourlyForecastLabel)
//        addSubview(collectionView)
//        backgroundView.addSubview(dailyForecastLabel)
    }
        
//    private func configConstraints(){
//        
//        NSLayoutConstraint.activate([
//            statsStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24),
//            statsStackView.widthAnchor.constraint(equalToConstant: 206),
//            statsStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
//        ])
//        

//        
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: hourlyForecastLabel.bottomAnchor, constant: 20),
//            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            collectionView.heightAnchor.constraint(equalToConstant: 100)
//        ])
//
}
