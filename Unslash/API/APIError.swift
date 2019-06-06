//
//  APIError.swift
//  xSystem
//
//  Created by Zahar on 29/03/2019.
//  Copyright © 2019 xProjects. All rights reserved.
//

import Foundation

internal enum APIError: Error {
	case network(Error)
	case decoding(Error)
	case invalidResponse
	case uncurrectData 
}
