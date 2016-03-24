//
//  NSPageControl.swift
//  NSPageControl
//
//  Created by Kohei Tabata on 2016/03/24.
//  Copyright © 2016年 Kohei Tabata. All rights reserved.
//

import Cocoa

public class NSPageControl: NSView {

    public var numberOfPages: Int   = 0
    public var currentPage: Int     = 0 {
        didSet(oldValue) {
            if currentPage < 0 {
                currentPage = 0
            }
            if currentPage > numberOfPages {
                currentPage = numberOfPages
            }
            didSetCurrentPage(oldValue, newlySelectedPage: currentPage)
        }
    }
    public var hidesForSinglePage: Bool = true
    public var pageIndicatorTintColor: NSColor = NSColor.darkGrayColor()
    public var currentPageIndicatorTintColor: NSColor = NSColor.whiteColor()
    public var animationDuration: CFTimeInterval = 0.04
    public var dotLength: CGFloat = 8.0
    public var dotMargin: CGFloat = 12.0

    private var dotLayers: [CAShapeLayer] = []

    //MARK: - lifecycle

    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    public override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        let minimumRequiredWidth: CGFloat = dotLength * CGFloat(numberOfPages) + dotMargin * CGFloat((numberOfPages - 1))

        let hasEnoughHeight: Bool   = dirtyRect.height >= dotLength
        let hasEnoughWidth: Bool    = dirtyRect.width >= minimumRequiredWidth
        if !hasEnoughWidth || !hasEnoughHeight {
            NSLog("dirtyRect doesn't have enough space to draw all dots")
            NSLog("current Rect :\(dirtyRect)")
            NSLog("required Size:\(CGSize(width: minimumRequiredWidth, height: dotLength))")
        }

        for layer in dotLayers {
            layer.removeFromSuperlayer()
        }
        dotLayers = []
        self.layer      = CALayer()
        self.wantsLayer = true

        for i: Int in 0..<numberOfPages {
            let x: CGFloat              = (dirtyRect.width - minimumRequiredWidth) / 2 + (dotLength + dotMargin) * CGFloat(i)
            let y: CGFloat              = (dirtyRect.height - dotLength) / 2 - dotLength / 2
            let rect: CGRect            = NSRect(x: x, y: y, width: dotLength, height: dotLength)
            let cgPath: CGMutablePath   = CGPathCreateMutable()
            CGPathAddEllipseInRect(cgPath, nil, rect)

            let fillColor: NSColor          = (i == currentPage) ? currentPageIndicatorTintColor : pageIndicatorTintColor
            let shapeLayer: CAShapeLayer    = CAShapeLayer()
            shapeLayer.path                 = cgPath
            shapeLayer.fillColor            = fillColor.CGColor

            layer?.addSublayer(shapeLayer)
            dotLayers.append(shapeLayer)
        }
    }

    //MARK: - private

    private func didSetCurrentPage(selectedPage: Int, newlySelectedPage: Int) {
        if selectedPage == newlySelectedPage {
            return
        }

        let oldPageAnimation: CABasicAnimation = fillColorAnimation(pageIndicatorTintColor)
        dotLayers[selectedPage].addAnimation(oldPageAnimation, forKey: "oldPageAnimation")
        let newPageAnimation: CABasicAnimation = fillColorAnimation(currentPageIndicatorTintColor)
        dotLayers[newlySelectedPage].addAnimation(newPageAnimation, forKey: "newPageAnimation")
    }

    private func fillColorAnimation(color: NSColor) -> CABasicAnimation {
        let fillColorAnimation: CABasicAnimation = CABasicAnimation(keyPath: "fillColor")
        fillColorAnimation.toValue    = color.CGColor
        fillColorAnimation.duration   = animationDuration
        fillColorAnimation.fillMode = kCAFillModeForwards
        fillColorAnimation.removedOnCompletion = false
        return fillColorAnimation
    }
}
