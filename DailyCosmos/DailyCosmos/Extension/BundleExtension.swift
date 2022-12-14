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
    
    var CLIENT_ID: String {
        guard let file = self.path(forResource: "APIsInfo", ofType: "plist") else { return "" }
        
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        
        guard let key = resource["CLIENT_ID"] as? String else {
            fatalError("CLIENT_ID not found")
        }
        
        return key
    }
    
    var CLIENT_SECRET: String {
        guard let file = self.path(forResource: "APIsInfo", ofType: "plist") else { return "" }
        
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        
        guard let key = resource["CLIENT_SECRET"] as? String else {
            fatalError("CLIENT_SECRET not found")
        }
        
        return key
    }

}
