//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Isaac Kao on 2024/3/15.
//

import Foundation

protocol HTTPClient {
    func get(from url: URL, completion: @escaping (Error?, HTTPURLResponse?) -> Void)
}

class RemoteFeedLoader {
    let client: HTTPClient
    let url: URL
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }

    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Error) -> Void) {
        client.get(from: url) { error, response in
            if response != nil {
                completion(.invalidData)
            } else {
                completion(.connectivity)
            }
        }
    }
}

