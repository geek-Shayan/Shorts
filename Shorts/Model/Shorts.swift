//
//  Shorts.swift
//  Shorts
//
//  Created by SHAYANUL HAQ SADI on 8/9/23.
//

import Foundation
import Alamofire

// MARK: - Shorts
class Shorts: Codable {
    let success: Bool
    let shorts: [Short]
    
    init(success: Bool, shorts: [Short]) {
            self.success = success
            self.shorts = shorts
        }
}


// Define a function to make the API request
func fetchData(completion: @escaping (Shorts?, Error?) -> Void) {
    let apiUrl = "https://iptv-isp.nexdecade.com/images/sample_shorts.json?rnd=24368219491642" // Replace with the actual API URL

    AF.request(apiUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { response in
        switch response.result {
        case .success:
            if let data = response.data {
                do {
                    let decoder = JSONDecoder()
                    let apiResponse = try decoder.decode(Shorts.self, from: data)
                    completion(apiResponse, nil)
                } catch {
                    completion(nil, error)
                }
            }
        case .failure(let error):
            completion(nil, error)
        }
    }
}

//// Usage example
//fetchData { (apiResponse, error) in
//    if let apiResponse = apiResponse {
//        // Use the parsed data
//        print("Success: \(apiResponse.success)")
//        for short in apiResponse.shorts {
//            print("Description: \(short.description)")
//            print("Thumbnail URL: \(short.thumbnail)")
//            // Add more properties as needed
//        }
//    } else if let error = error {
//        // Handle the error
//        print("Error: \(error.localizedDescription)")
//    }
//}
