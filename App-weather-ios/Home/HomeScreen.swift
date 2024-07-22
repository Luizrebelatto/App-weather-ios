//
//  HomeScreen.swift
//  App-weather-ios
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 01/07/24.
//

import UIKit

class HomeScreen: UIView {
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cachoeirinha"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = UIColor.blueDark
        label.textAlignment = .center
        return label
    }()
    
    private lazy var imageWeather: UIView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage.sunIconImage
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "54°C"
        label.textColor = UIColor.blueDark
        label.font = UIFont.systemFont(ofSize: 60, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var eventWeather: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sol"
        label.textColor = UIColor.blueDark
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var infoWeather: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "H: 12°C | L: 14°C"
        label.textColor = UIColor.blueDark
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [eventWeather, infoWeather])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        stackView.spacing = 4
        return stackView
    }()
        
    private lazy var allCardTemperatures: UIView = {
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.clipsToBounds = true
        card.layer.cornerRadius = 20
        card.backgroundColor = UIColor.opacityBlueCard
        return card
    }()
    
    private lazy var cardTemperature: UIStackView = {
        let cardToday = CardToday(frame: .zero)
        cardToday.viewModel = CardTodayViewModel()
        return cardToday
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
        collectionView.isScrollEnabled = false
        collectionView.register(HourlyForecastCardCollectionViewCell.self, forCellWithReuseIdentifier: HourlyForecastCardCollectionViewCell.identifier)
        return collectionView
    }()
    
    private lazy var chartContainerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor.clear
        containerView.layer.cornerRadius = 20
        containerView.clipsToBounds = true
        return containerView
    }()
    
    private lazy var chartView: LineChartView = {
        let chart = LineChartView()
        chart.translatesAutoresizingMaskIntoConstraints = false
        chart.backgroundColor = UIColor.mediumBlue
        chart.layer.cornerRadius = 20
        chart.clipsToBounds = true
        return chart
    }()
    
    private lazy var chartScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .softBlue
        setHierarchy()
        configConstraints()
        setupChart()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configProtocolsColletionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource){
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    private func setHierarchy() {
        addSubview(cityLabel)
        addSubview(imageWeather)
        addSubview(temperatureLabel)
        addSubview(infoStackView)
        addSubview(cardTemperature)
        addSubview(allCardTemperatures)
        allCardTemperatures.addSubview(collectionView)
        addSubview(chartContainerView)
        chartContainerView.addSubview(chartScrollView)
        chartScrollView.addSubview(chartView)
    }
        
    private func configConstraints(){
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            cityLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageWeather.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 75),
            imageWeather.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            imageWeather.heightAnchor.constraint(equalToConstant: 200),
            imageWeather.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: imageWeather.bottomAnchor, constant: 50),
            temperatureLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            infoStackView.topAnchor.constraint(equalTo: temperatureLabel.topAnchor, constant: 5),
            infoStackView.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            cardTemperature.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 40),
            cardTemperature.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            cardTemperature.heightAnchor.constraint(equalToConstant: 140),
            cardTemperature.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            allCardTemperatures.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 40),
            allCardTemperatures.leadingAnchor.constraint(equalTo: cardTemperature.leadingAnchor, constant: 120),
            allCardTemperatures.heightAnchor.constraint(equalToConstant: 140),
            allCardTemperatures.widthAnchor.constraint(equalToConstant: 270)
        ])
        
        NSLayoutConstraint.activate([
            chartContainerView.topAnchor.constraint(equalTo: cardTemperature.bottomAnchor, constant: 40),
            chartContainerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            chartContainerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            chartContainerView.heightAnchor.constraint(equalToConstant: 120),
        ])
                
        NSLayoutConstraint.activate([
            chartScrollView.topAnchor.constraint(equalTo: chartContainerView.topAnchor),
            chartScrollView.leadingAnchor.constraint(equalTo: chartContainerView.leadingAnchor),
            chartScrollView.trailingAnchor.constraint(equalTo: chartContainerView.trailingAnchor),
            chartScrollView.bottomAnchor.constraint(equalTo: chartContainerView.bottomAnchor)
        ])
                
        NSLayoutConstraint.activate([
            chartView.topAnchor.constraint(equalTo: chartScrollView.topAnchor),
            chartView.leadingAnchor.constraint(equalTo: chartScrollView.leadingAnchor),
            chartView.trailingAnchor.constraint(equalTo: chartScrollView.trailingAnchor),
            chartView.bottomAnchor.constraint(equalTo: chartScrollView.bottomAnchor),
            chartView.heightAnchor.constraint(equalTo: chartScrollView.heightAnchor),
            chartView.widthAnchor.constraint(equalToConstant: 1000) 
            
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: allCardTemperatures.topAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: allCardTemperatures.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: allCardTemperatures.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func setupChart() {
        let graphicData: [CGFloat] = [30, 50, 70, 40, 60, 80, 50, 80, 30, 20, 30, 50, 70, 40, 60, 80, 50, 80, 30, 20]
        chartView.data = graphicData
    }
}
