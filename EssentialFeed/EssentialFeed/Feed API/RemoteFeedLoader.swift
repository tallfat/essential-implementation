//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Isaac Kao on 2024/3/15.
//

import Foundation

protocol HTTPClient {
    func get(from url: URL, completion: @escaping (Error) -> Void)
}

class RemoteFeedLoader {
    let client: HTTPClient
    let url: URL
    
    public enum Error: Swift.Error {
        case connectivity
    }

    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Error) -> Void = { _ in }) {
        client.get(from: url) { error in
            completion(.connectivity)
        }
    }
}

