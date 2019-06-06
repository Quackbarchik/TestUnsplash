//
//  APIEndpoint.swift
//  xSystem
//
//  Created by Zahar on 29/03/2019.
//  Copyright © 2019 xProjects. All rights reserved.
//

import Alamofire
import Foundation

internal protocol APIEndpoint {
	
	associatedtype Response: Decodable
	
	var path: String { get }
	
	var headers: HTTPHeaders? { get }
	
	var parameters: Parameters? { get }
	
	var encoding: ParameterEncoding { get }
	
	var method: HTTPMethod { get }
}

