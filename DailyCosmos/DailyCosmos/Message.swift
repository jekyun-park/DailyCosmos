//
//  Message.swift
//  FetchDataSample
//
//  Created by 박제균 on 2022/11/24.
//

import Foundation

struct TranslateResponse: Decodable {
    let message: Message
}

struct Message: Decodable {
    
    let type: String
    let service: String
    let version: String
    let result: Result
    
    enum CodingKeys: String, CodingKey {
        case result
        case type = "@type"
        case service = "@service"
        case version = "@version"
    }
    
}

struct Result:Decodable {
    let translatedText:String
}
