//
//  SpaceData.swift
//  FetchDataSample
//
//  Created by 박제균 on 2022/11/24.
//

import Foundation

struct SpaceData: Decodable {

    var date: String
    var explanation: String
//    var hdURL: String?
    var mediaType: String
    var title: String
    var URL: String

    enum CodingKeys: String, CodingKey {
        case date, explanation, title
//        case hdURL = "hdurl"
        case mediaType = "media_type"
        case URL = "url"
    }

}
