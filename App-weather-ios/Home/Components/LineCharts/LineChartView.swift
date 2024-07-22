//
//  LineChartView.swift
//  App-weather-ios
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 21/07/24.
//

import UIKit

class LineChartView: UIView {

    var data: [CGFloat] = [] {
        didSet {
            setNeedsDisplay()
            setContentSize()
        }
    }

    private let initialVisiblePoints = 3

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }

        context.setStrokeColor(UIColor.white.cgColor)
        context.setLineWidth(2.0)

        guard data.count > 1 else { return }

        let stepX = rect.width / CGFloat(data.count - 1)
        let path = UIBezierPath()

        for (index, value) in data.enumerated() {
            let x = CGFloat(index) * stepX
            let y = rect.height - value
            let point = CGPoint(x: x, y: y)

            if index == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
            
            let circleRect = CGRect(x: x - 5, y: y - 5, width: 10, height: 10)
            context.setFillColor(UIColor.softBlue.cgColor)
            context.fillEllipse(in: circleRect)
            
            let numberString = "\(Int(value))" as NSString
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 12),
                .foregroundColor: UIColor.white
            ]
            let textSize = numberString.size(withAttributes: attributes)
            let textPoint = CGPoint(x: x - textSize.width / 2, y: y - textSize.height - 10)
            numberString.draw(at: textPoint, withAttributes: attributes)
        }

        path.stroke()
    }
    
    private func setContentSize() {
        let contentWidth = CGFloat(data.count - 1) * frame.width / CGFloat(initialVisiblePoints - 1)
        let contentSize = CGSize(width: contentWidth, height: frame.height)
        
        if let scrollView = superview as? UIScrollView {
            scrollView.contentSize = contentSize
        }
    }
}
