//
//  HomeViewController.swift
//  App-weather-ios
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 02/07/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var homeScreen: HomeScreen?
    private var viewModel: HomeViewModel = HomeViewModel()
        
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    private let service = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen?.configProtocolsColletionView(delegate: self, dataSource: self)
        
        Service().currentWeatherData(city: "cachoeirinha") { message in
            print("Mensagem retorno api: \(message)")
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyForecastCardCollectionViewCell.identifier, for: indexPath) as?
        HourlyForecastCardCollectionViewCell
        cell?.setupCell(listHourly: viewModel.getListHourly)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 300, height: 100)
    }
}
