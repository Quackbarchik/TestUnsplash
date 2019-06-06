//
//  APIHTTPClient.swift
//  xSystem
//
//  Created by Zahar on 11/04/2019.
//  Copyright © 2019 xProjects. All rights reserved.
//

import Alamofire
import Foundation

internal protocol APIHTTPClient: class {
	func request<E: APIEndpoint>(_ endpoint: E, completion: @escaping (AFResult<E.Response>) -> Void)
}

internal class APIHTTPClientImpl: APIHTTPClient {
	
	// MARK: - Properties
	
	private let baseUrl: URL
	
	// MARK: - Init
	
	init(baseUrl: URL) {
		self.baseUrl = baseUrl
	}
	
	// MARK: - APIClient
	
	func request<E: APIEndpoint>(_ endpoint: E, completion: @escaping (AFResult<E.Response>) -> Void) {
		
		let url = baseUrl.appendingPathComponent(endpoint.path)
		
		AF.request(url, method: endpoint.method, parameters: endpoint.parameters, encoding: endpoint.encoding, headers: endpoint.headers).validate().responseDecodable { (response: DataResponse<E.Response>) in
			
			switch response.result {
			case .success(let data):
				completion(.success(data))
			case .failure(let error):
				completion(.failure(APIError.network(error)))
			}
		}
		
	}
	
}
