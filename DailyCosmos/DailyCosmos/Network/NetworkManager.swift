//
//  NetworkManager.swift
//  FetchDataSample
//
//  Created by 박제균 on 2022/11/24.
//

import Foundation

final class NetworkManager {
    
    static let shared: NetworkManager = NetworkManager()
    
    var defaultRequestURL: String {
        "https://api.nasa.gov/planetary/apod?api_key=\(Bundle.main.NASA_API_KEY)&date="
    }

    func fetchDataWithURLString <T:Decodable> (urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else { fatalError("Unvalid URL") }

        let (data, _) = try await URLSession.shared.data(from: url)

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print(error)
            fatalError("fail to decode data")
        }
    }
    
    func decodeData <T: Decodable> (_ data: Data) -> T {
        do  {
            return try JSONDecoder().decode(T.self, from: data)
        } catch (let error) {
            print(error)
            fatalError("Fail to decode Data")
        }
    }
    
    func requestTranslate(_ string:String) async throws -> Data {
        
        let session = URLSession.shared
        let clientID = Bundle.main.CLIENT_ID
        let clientSecret = Bundle.main.CLIENT_SECRET
        
        let stringWithParameters = "source=en&target=ko&text=\(string)"
        let data = stringWithParameters.data(using: .utf8)!
        
        guard let url = URL(string: "https://openapi.naver.com/v1/papago/n2mt") else { fatalError("unvalid url") }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        request.setValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        request.httpBody = data
        
        
        let (responseData, _ ) = try await session.upload(for: request, from: data)
        
        return responseData
    }

}
