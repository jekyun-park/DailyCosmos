//
//  BundleExtension.swift
//  DailyCosmos
//
//  Created by 박제균 on 2022/11/25.
//

import Foundation

extension Bundle {

    var NASA_API_KEY: String {
        guard let file = self.path(forResource: "APIsInfo", ofType: "plist") else { return "" }
        
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        
        guard let key = resource["NASA_API_KEY"] as? String else {
            fatalError("NASA_API_KEY not found")
        }
        
        return key
    }

}
