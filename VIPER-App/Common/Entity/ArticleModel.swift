//
//  Article.swift
//  VIPER-App
//
//  Created by Fatih Gursoy on 7.10.2022.
//

import Foundation

struct Article: Codable {
    
    let source: Source?
    let author, title, articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }

}

// MARK: - Source
struct Source: Codable {
        let id, name: String?
}
