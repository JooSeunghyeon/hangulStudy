//
//  WordView.swift
//  HangulStudy
//
//  Created by EAN on 23/09/2019.
//  Copyright © 2019 EAN. All rights reserved.
//

import UIKit

protocol WordViewwDelegate: AnyObject {
    func touchBeginView ()
}

class WordView: UIView {

    weak var delegate: WordViewwDelegate?
    
    private let xibName = "WordView"
    
    var brushColor = UIColor.black
    var brushWidth: CGFloat = 8.0
    var lastPoint = CGPoint.zero
    var isDrawing = false
    
    var isFirstTouch = false

    @IBOutlet weak var tImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit(){
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    override func layoutSubviews() {
        let topPoint = CGPoint(x: self.bounds.midX, y: self.bounds.origin.y)
        let bottomPoint = CGPoint(x: self.bounds.midX, y: self.bounds.maxY)
        
        let leftPoint = CGPoint(x: self.bounds.minX, y: self.bounds.midY)
        let rightPoint = CGPoint(x: self.bounds.maxX, y: self.bounds.midY)
        
        self.createDashedLine(from: topPoint, to: bottomPoint, color: #colorLiteral(red: 168/255.0, green: 168/255.0, blue: 168/255.0, alpha: 1), strokeLength: 4, gapLength: 6, width: 1)
        
        self.createDashedLine(from: leftPoint, to: rightPoint, color: #colorLiteral(red: 168/255.0, green: 168/255.0, blue: 168/255.0, alpha: 1), strokeLength: 4, gapLength: 6, width: 1)
    }
    
    func drawLine(from: CGPoint, to: CGPoint) {
        
        
        print(tImageView.frame.size)
        
        // 1
        UIGraphicsBeginImageContext(tImageView.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        tImageView.image?.draw(in: tImageView.bounds)
        // 2
        context.setLineWidth(brushWidth)
        context.setStrokeColor(brushColor.cgColor)
        context.setLineCap(CGLineCap.round)
        // 3
        context.move(to: from)
        context.addLine(to: to)
        // 4
        context.strokePath()
        // 5
        tImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDrawing = false
        if let touch = touches.first {
            lastPoint = touch.location(in: tImageView)
        }
        
        if isFirstTouch == false {
            delegate?.touchBeginView()
            isFirstTouch = true
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDrawing = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: tImageView)
            drawLine(from: lastPoint, to: currentPoint)
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isDrawing {
            drawLine(from: lastPoint, to: lastPoint)
        }
        isDrawing = false
    }
    
    public func setClear () {
        tImageView.image = nil
        isFirstTouch = false
    }
}

extension UIView {

    func createDashedLine(from point1: CGPoint, to point2: CGPoint, color: UIColor, strokeLength: NSNumber, gapLength: NSNumber, width: CGFloat) {
        let shapeLayer = CAShapeLayer()

        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = width
        shapeLayer.lineDashPattern = [strokeLength, gapLength]
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.fillRule = CAShapeLayerFillRule.nonZero
        
        let path = CGMutablePath()
        path.addLines(between: [point1, point2], transform: .identity)
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
}
