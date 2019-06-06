//
//  APIDataTask.swift
//  xSystem
//
//  Created by Zahar on 13/04/2019.
//  Copyright © 2019 xProjects. All rights reserved.
//

import Foundation
import Alamofire

internal class APIDataTask<Body: Encodable, Response: Decodable>: APIEndpoint {
	
	let path: String
	
	let headers: HTTPHeaders?
	
	private let underlingBody: Body
	
	let method: HTTPMethod
	
	init(path: String,
		 method: HTTPMethod = .post,
		 headers: HTTPHeaders? = nil,
		 body: Body) {
		
		var headers = headers ?? []
		headers.add(name: "Content-Type", value: "application/json")
		
		self.path = path
		self.method = method
		self.underlingBody = body
		self.headers = headers
	}
	
	var parameters: Parameters? {
		let encoder = JSONEncoder()
		encoder.outputFormatting = .prettyPrinted
		encoder.keyEncodingStrategy = .convertToSnakeCase
		
		do {
			let encodedData = try encoder.encode(underlingBody)
			let json = try JSONSerialization.jsonObject(with: encodedData, options: [])
			
			return json as? Parameters
			
		} catch let error {
			print("Failed to encode:", error)
			return nil
		}
	}
	
	var encoding: ParameterEncoding {
		return JSONEncoding(options: [])
	}
	
}

