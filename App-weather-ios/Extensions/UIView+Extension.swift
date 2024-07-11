//
//  UIView+Extensions.swift
//  App-weather-ios
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 22/06/24.
//

import Foundation
import UIKit

extension UIView {
    func setConstraintsToParent(_ parent: UIView) {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: parent.topAnchor),
            self.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: parent.bottomAnchor)
        ])
    }
    
    func pin(to superView: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor),
                        leadingAnchor.constraint(equalTo: superView.leadingAnchor),
                        trailingAnchor.constraint(equalTo: superView.trailingAnchor),
                        bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])
    }
}
