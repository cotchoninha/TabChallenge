//
//  NetworkModel.swift
//  TabChallenge
//
//  Created by Spare on 01/06/2020.
//  Copyright © 2020 Spare. All rights reserved.
//

import Foundation

struct Projects: Decodable {
    let caseStudies: [CaseStudies]
    
    enum CodingKeys: String, CodingKey {
        case caseStudies = "case_studies"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        caseStudies = try container.decode([CaseStudies].self, forKey: .caseStudies)
    }
}

struct CaseStudies: Decodable {
    let id: Int
    let client: String?
    let teaser: String
    let vertical: String
    let isEnterprise: Bool
    let title: String?
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
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        client = try container.decode(String.self, forKey: .client)
        teaser = try container.decode(String.self, forKey: .teaser)
        vertical = try container.decode(String.self, forKey: .vertical)
        isEnterprise = try container.decode(Bool.self, forKey: .isEnterprise)
        title = try container.decode(String?.self, forKey: .title)
        heroImage = try container.decode(String.self, forKey: .heroImage)
        sections = try container.decode([Sections].self, forKey: .sections)
        
    }
}

struct Sections: Decodable {
    let title: String?
    let bodyElements: [BodyElements]
    
    enum CodingKeys: String, CodingKey {
        case title
        case bodyElements = "body_elements"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String?.self, forKey: .title)
        bodyElements = try container.decode([BodyElements].self, forKey: .bodyElements)
    }
}


struct BodyElements: Decodable {
    let body: String
    let image: BodyImage
    
    init(from decoder: Decoder) throws {
        var unkeyedContainer = try decoder.unkeyedContainer()
        let singleContainer = try decoder.singleValueContainer()
        body = try unkeyedContainer.decode(String.self)
        image = try singleContainer.decode(BodyImage.self)
    }
}

struct BodyImage: Decodable {
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        imageUrl = try container.decode(String.self, forKey: .imageUrl)
    }
    
}
