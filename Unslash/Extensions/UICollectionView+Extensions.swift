//
//  UICollectionView+Extensions.swift
//  xSystem
//
//  Created by Zahar on 29/03/2019.
//  Copyright © 2019 xProjects. All rights reserved.
//

import UIKit

extension UICollectionReusableView {
	
	class func defaultReuseIdentifier() -> String {
		return String(describing: self)
	}
	
}

extension UICollectionView {
	
	func register<T: UICollectionViewCell>(cellClass: T.Type) {
		register(cellClass, forCellWithReuseIdentifier: cellClass.defaultReuseIdentifier())
	}
	
	func register<T: UICollectionReusableView>(supplementaryViewClass viewClass: T.Type, kind: String) {
		register(viewClass, forSupplementaryViewOfKind: kind, withReuseIdentifier: viewClass.defaultReuseIdentifier())
	}
	
	func dequeueReusableCell<T: UICollectionViewCell>(withClass cellClass: T.Type, forIndexPath: IndexPath) -> T {
		guard let cell = dequeueReusableCell(
			withReuseIdentifier: cellClass.defaultReuseIdentifier(),
			for: forIndexPath
			) as? T else {
				fatalError("""
					Error: cell with identifier: \(cellClass.defaultReuseIdentifier()) \
					for index path: \(forIndexPath) is not \(T.self)
					""")
		}
		return cell
	}
	
	func dequeueReusableSupplementaryView<T>(withClass viewClass: T.Type, kind: String, forIndexPath: IndexPath) -> T
		where T: UICollectionReusableView {
			guard let view = dequeueReusableSupplementaryView(
				ofKind: kind,
				withReuseIdentifier: viewClass.defaultReuseIdentifier(),
				for: forIndexPath
				) as? T else {
					fatalError("""
						Error: view with identifier: \(viewClass.defaultReuseIdentifier()) \
						kind: \(kind) for index path: \(forIndexPath) is not \(T.self)
						""")
			}
			return view
	}
}
