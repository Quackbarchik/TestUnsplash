//
//  API+SearchPhoto.swift
//  Unslash
//
//  Created by Zahar on 06/06/2019.
//

import Foundation

public enum API {
    enum Photos {
        
        struct Results: Decodable {
            let results: [Photo]
        }
        
        struct Photo: Decodable {
            let urls: ImageUrls
        }
        
        struct ImageUrls: Decodable {
            let full: String
        }
        
        static func getPhotosWith(query: String) -> APITask<Results> {
            return APITask(path: "search/photos",
                           method: .get,
                           parameters: ["query": "\(query)"],
                           headers: ["Accept-Version": "v1", "Authorization": "Client-ID 6233247b636667cd816e078ee0badacf17c4e0d79d19927764e045fbdd89e8ef"])
        }
        
    }
}
