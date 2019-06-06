//
//  UITableView+Extension.swift
//  xSystem
//
//  Created by Zahar on 29/03/2019.
//  Copyright © 2019 xProjects. All rights reserved.
//

import UIKit

extension UITableViewCell {
	
	class func defaultReuseIdentifier() -> String {
		return String(describing: self)
	}
	
}

extension UITableViewHeaderFooterView {
	
	class func defaultReuseIdentifier() -> String {
		return String(describing: self)
	}
	
}

extension UITableView {
	
	func register<T: UITableViewCell>(cellClass: T.Type) {
		register(cellClass, forCellReuseIdentifier: cellClass.defaultReuseIdentifier())
	}
	
	func register<T: UITableViewHeaderFooterView>(headerFooterClass viewClass: T.Type) {
		register(viewClass, forHeaderFooterViewReuseIdentifier: viewClass.defaultReuseIdentifier())
	}
	
	func dequeueReusableCell<T: UITableViewCell>(withClass cellClass: T.Type) -> T? {
		return dequeueReusableCell(withIdentifier: cellClass.defaultReuseIdentifier()) as? T
	}
	
	func dequeueReusableCell<T: UITableViewCell>(withClass cellClass: T.Type, forIndexPath: IndexPath) -> T {
		guard let cell = dequeueReusableCell(
			withIdentifier: cellClass.defaultReuseIdentifier(),
			for: forIndexPath
			) as? T else {
				fatalError("""
					Error: cell with identifier: \(cellClass.defaultReuseIdentifier()) \
					for index path: \(forIndexPath) is not \(T.self)"
					""")
		}
		return cell
	}
	
	func dequeueHeaderFooter<T: UITableViewHeaderFooterView>(withClass viewClass: T.Type) -> T {
		guard let view = dequeueReusableHeaderFooterView(
			withIdentifier: viewClass.defaultReuseIdentifier()
			) as? T else {
				fatalError("""
					Error: view with \(viewClass.defaultReuseIdentifier()) is not registered
					""")
		}
		return view
	}
	
}

