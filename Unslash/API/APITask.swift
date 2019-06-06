//
//  APITask.swift
//  xSystem
//
//  Created by Zahar on 29/03/2019.
//  Copyright © 2019 xProjects. All rights reserved.
//

import Alamofire
import Foundation

internal class APITask<Response: Decodable>: APIEndpoint {
	
	let path: String
	
	let parameters: Parameters?
	
	let headers: HTTPHeaders?
	
	let method: HTTPMethod
	
	init(path: String,
		 method: HTTPMethod = .post,
		 parameters: Parameters? = nil,
		 headers: HTTPHeaders? = nil) {
		
		var headers = headers ?? []
		headers.add(name: "Content-Type", value: "application/json")
		
		self.path = path
		self.method = method
		self.parameters = parameters
		self.headers = headers
	}
	
	var encoding: ParameterEncoding {
		return URLEncoding.queryString
	}
}
