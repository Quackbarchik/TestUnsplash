//
//  UIView+Extension.swift
//  xSystem
//
//  Created by Zahar on 12/03/2019.
//  Copyright © 2019 xProjects. All rights reserved.
//

import UIKit

extension UIView {
	
	func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
		let path = UIBezierPath(roundedRect: self.bounds,
								byRoundingCorners: corners,
								cornerRadii: CGSize(width: radius, height: radius))
		let mask = CAShapeLayer()
		mask.path = path.cgPath
		self.layer.mask = mask
	}
	
    func shadowView(width: CGFloat, height: CGFloat) {
        
       layer.shadowColor = UIColor.black.cgColor
       layer.shadowOffset = CGSize(width: width, height: height)
       layer.shadowOpacity = 0.7
       layer.shadowRadius = 4.0
        
    }
    
}
