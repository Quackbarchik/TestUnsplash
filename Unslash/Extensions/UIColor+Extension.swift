//
//  UIColor+Extension.swift
//  xSystem
//
//  Created by Zahar on 28/02/2019.
//  Copyright © 2019 xProjects. All rights reserved.
//

import UIKit

extension UIColor {
	
//	 Setup custom colours we can use throughout the app using hex values
	static let appBlack = UIColor(hex: 0x3b3b3b)
	static let appGreyishBrownWithAlpha = UIColor(hex: 0x404040, a: 0.3)
	static let appGreyishBrown = UIColor(hex: 0x404040)
	static let appPalePurple = UIColor(hex: 0xa9a9b0)
	static let appGreyishBrownTwo = UIColor(hex: 0x4f4f4f)
	static let appPaleGrey = UIColor(hex: 0xf1f1f5)
	static let appBrownGrey = UIColor(hex: 0xafafaf)
	static var appCharcoalGrey = UIColor(hex: 0x303740)
	static var appSilver = UIColor(hex: 0xbac0c5)
	
	
	// Create a UIColor from RGB
	convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
		self.init(
			red: CGFloat(red) / 255.0,
			green: CGFloat(green) / 255.0,
			blue: CGFloat(blue) / 255.0,
			alpha: a
		)
	}
	
	// Create a UIColor from a hex value (E.g 0x000000)
	convenience init(hex: Int, a: CGFloat = 1.0) {
		self.init(
			red: (hex >> 16) & 0xFF,
			green: (hex >> 8) & 0xFF,
			blue: hex & 0xFF,
			a: a
		)
	}

	convenience init(hexString: String) {
		let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
		var int = UInt32()
		Scanner(string: hex).scanHexInt32(&int)
		let a, r, g, b: UInt32
		switch hex.count {
		case 3: // RGB (12-bit)
			(a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
		case 6: // RGB (24-bit)
			(a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
		case 8: // ARGB (32-bit)
			(a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
		default:
			(a, r, g, b) = (255, 0, 0, 0)
		}
		self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
	}
}
