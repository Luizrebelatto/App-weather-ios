//
//  HourlyForecastScreenCollectionViewCell.swift
//  App-weather-ios
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 26/06/24.
//

import UIKit

class HourlyForecastCardCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "HourlyForecastCardCollectionViewCell"
    
    private var screen: HourlyForecastCardScreen = HourlyForecastCardScreen()
    
    private var viewModel: HourlyForecastViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configScreen()
        screen.configProtocolsCollectionView(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen(){
        screen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(screen)
        screen.pin(to: contentView)
    }
    
    public func setupCell(listHourly: [HourlyForecasts]){
        viewModel = HourlyForecastViewModel(listHourlyForecast: listHourly)
    }
}

extension HourlyForecastCardCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.numberOfItems ?? 00
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel = viewModel else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyForecastCollectionCell.identifier, for: indexPath) as? HourlyForecastCollectionCell
        cell?.setupCell(data: viewModel.loudCurrentHourlyForecast(indexPath: indexPath), indexPath: indexPath)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: collectionView.frame.height)
    }
    
}
