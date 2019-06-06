//
//  Encodable+Extension.swift
//  xSystem
//
//  Created by Zahar on 15/03/2019.
//  Copyright © 2019 xProjects. All rights reserved.
//

import Foundation

extension Encodable {
	var dictionary: [String: Any]? {
		guard let data = try? JSONEncoder().encode(self) else {
			return nil
		}
		return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap {
			$0 as? [String: Any]
		}
	}
}

public func decode<T:Codable>(data: Data, type: T.Type) -> T? {
	
	do {
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		
		return try decoder.decode(type, from: data)
	} catch let error {
		
		print("Failed to decode:", error)
		return nil
	}
}
