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
        backgroundView.setConstraintsToParent(collectionView)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}