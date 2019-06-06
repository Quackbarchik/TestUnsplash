//
//  Double+Extension.swift
//  xSystem
//
//  Created by Zahar on 15/04/2019.
//  Copyright © 2019 xProjects. All rights reserved.
//

import Foundation
import UIKit

extension Double {
	func getDateStringFromUTC() -> String {
		let date = Date(timeIntervalSince1970: self)
		
		let dateFormatter = DateFormatter()
		dateFormatter.locale = Locale(identifier: "ru_RU")
		dateFormatter.dateFormat = "dd.MM.YY"
		
		return dateFormatter.string(from: date)
	}
}
