//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Isaac Kao on 2024/3/11.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
