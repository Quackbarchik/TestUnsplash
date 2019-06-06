//
//  Config.swift
//  xSystem
//
//  Created by Zahar on 11/04/2019.
//  Copyright © 2019 xProjects. All rights reserved.
//

import Foundation

internal class Config {
	
	static let shared: Config = Config()
	
	private init() { }
	
	let apiUrl: URL = URL(string: "https://api.unsplash.com/")!
}

