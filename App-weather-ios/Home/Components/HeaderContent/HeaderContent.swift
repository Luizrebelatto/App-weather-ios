//
//  HeaderContent.swift
//  App-weather-ios
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 05/08/24.
//

import UIKit

class HeaderContent: UIStackView {
    var viewModel: HeaderContentViewModelProtocol? {
        didSet {
            setDataBind()
        }
    }
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cachoeirinha"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = UIColor.blueDark
        label.textAlignment = .center
        return label
    }()
    
    private lazy var imageWeather: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage.sunIconImage
        img.contentMode = .scaleAspectFit
        return img
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
        axis = .vertical
        backgroundColor = .clear
        isLayoutMarginsRelativeArrangement = true
        spacing = 80
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 20, trailing: 0)
        
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        addArrangedSubview(cityLabel)
        addArrangedSubview(imageWeather)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            cityLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            cityLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                
            imageWeather.widthAnchor.constraint(equalToConstant: 250),
            imageWeather.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func setDataBind() {
        guard let viewModel = viewModel else { return }
        cityLabel.text = viewModel.titleCity
        imageWeather.image = viewModel.iconImage
    }
}
