//
//  RandomUser+ResponseData.swift
//  RandomUserApi
//
//  Created by kakao on 2023/09/08.
//

import Foundation


struct RandomUser: Codable, Identifiable, CustomStringConvertible { // Codable: Encodable과 Decodable 합친거다. Json을 객체에 담기용
    var id = UUID()
    var name: Name
    var photo: Photo
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case photo = "picture" // 실제 API응답 key는 picture 이지만, 스위프트에서는 photo 로 사용할거다.
    }
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return RandomUser(name: Name.getDummy(), photo: Photo.getDummy())
    }
    
    var profileImageUrl: URL {
        get {
            URL(string: photo.medium)!
        }
    }
    
    var description: String {
        return name.description
    }
}

struct Name: Codable, CustomStringConvertible {
    var title: String
    var first: String
    var last: String
    
    var description: String {
        return "[\(title)] \(last), \(first)"
    }
    
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return Name(title: "더미", first: "황", last: "준오")
    }
}

struct Photo: Codable {
    var large: String
    var medium: String
    var thumbnail: String
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return Photo(large: "https://randomuser.me/api/portraits/men/85.jpg",
                     medium: "https://randomuser.me/api/portraits/men/85.jpg",
                     thumbnail: "https://randomuser.me/api/portraits/men/85.jpg")
    }
}

struct Info: Codable {
    var seed: String
    var resultCount: Int
    var page: Int
    var version: String
    private enum CodingKeys: String, CodingKey {
        case seed = "seed"
        case resultCount = "results"
        case page = "page"
        case version = "version"
    }
}

struct RandomUserResponse: Codable, CustomStringConvertible {
    var results: [RandomUser]
    var info: Info
    private enum CodingKeys: String, CodingKey {
        case results = "results"
        case info = "info"
    }
    var description: String {
        return "results.count: \(results.count) / info: \(info.seed)"
    }
}
