//
//  UIFont+Extension.swift
//  xSystem
//
//  Created by Zahar on 13/03/2019.
//  Copyright © 2019 xProjects. All rights reserved.
//

import UIKit

extension UIFont {
	private static func customFont(name: String, size: CGFloat) -> UIFont {
		let font = UIFont(name: name, size: size)
		assert(font != nil, "Can't load font: \(name)")
		return font ?? UIFont.systemFont(ofSize: size)
	}
	
	static func regularFont(ofSize size: CGFloat) -> UIFont {
		return customFont(name: "SFProDisplay-Regular", size: size)
	}
	
	static func semiBoldFont(ofSize size: CGFloat) -> UIFont {
		return customFont(name: "SFProDisplay-Semibold", size: size)
	}
}
