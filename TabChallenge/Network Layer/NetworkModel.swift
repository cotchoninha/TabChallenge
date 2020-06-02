//
//  NetworkModel.swift
//  TabChallenge
//
//  Created by Spare on 01/06/2020.
//  Copyright © 2020 Spare. All rights reserved.
//

import Foundation

struct Projects: Decodable, Equatable {
    
    let caseStudies: [CaseStudies]
    
    enum CodingKeys: String, CodingKey {
        case caseStudies = "case_studies"
    }

}

struct CaseStudies: Decodable, Equatable {
    let id: Int
    let client: String?
    let teaser: String
    let vertical: String
    let isEnterprise: Bool
    let title: String
    let heroImage: String
    let sections: [Sections]
    
    enum CodingKeys: String, CodingKey {
        case id
        case client
        case teaser
        case vertical
        case isEnterprise = "is_enterprise"
        case title
        case heroImage = "hero_image"
        case sections
    }
}

struct Sections: Decodable, Equatable {
    let title: String?
    let bodyElements: [BodyElement]
    
    enum CodingKeys: String, CodingKey {
        case title
        case bodyElements = "body_elements"
    }
}


enum BodyElement: Codable, Equatable {
    case bodyImage(BodyImage)
    case title(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let title = try? container.decode(String.self) {
            self = .title(title)
            return
        }
        if let bodyImage = try? container.decode(BodyImage.self) {
            self = .bodyImage(bodyImage)
            return
        }
        throw DecodingError.typeMismatch(BodyElement.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Mismatch for BodyElement"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bodyImage(let bodyImage):
            try container.encode(bodyImage)
        case .title(let title):
            try container.encode(title)
        }
    }
}

struct BodyImage: Codable, Equatable {
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
    }
}
