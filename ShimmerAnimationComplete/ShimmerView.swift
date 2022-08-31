//
//  ShimmerView.swift
//  ShimmerAnimationComplete
//
//  Created by Jha, Vasudha on 29/11/19.
//  Copyright © 2019 Jha, Vasudha. All rights reserved.
//

import UIKit

/// Shimmer view
final class ShimmerView: UIView {
  private var animation: CABasicAnimation = {
    let animation = CABasicAnimation(keyPath: "locations")
    animation.fromValue = [-1.0, -0.5, 0.0]
    animation.toValue = [1.0, 1.5, 2.0]
    animation.repeatCount = .infinity
    animation.duration = 0.9
    return animation
  }()

  private lazy var gradientLayer: CAGradientLayer = {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = bounds
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
    gradientLayer.colors = [
      UIColor(white: 0.75, alpha: 1.0).cgColor,
      UIColor(white: 0.85, alpha: 1.0).cgColor,
      UIColor(white: 0.75, alpha: 1.0).cgColor]
    gradientLayer.locations = [0.0, 0.5, 1.0]
    return gradientLayer
  }()

  /// Begin animation
  func startAnimating() {
    layer.addSublayer(gradientLayer)
    gradientLayer.add(animation, forKey: animation.keyPath)
  }

  /// End animation
  func stopAnimating(){
    layer.removeAllAnimations()
    gradientLayer.removeFromSuperlayer()
   }
}
