//
//  APIDataManager.swift
//  Shorts
//
//  Created by SHAYANUL HAQ SADI on 9/9/23.
//

import Foundation
import Alamofire

class APIDataManager {
    static let shared = APIDataManager()
    
//    private var apiResponse: Shorts?
    
    private init() {}
    
    func fetchData(completion: @escaping (Shorts?, Error?) -> Void) {
        let apiUrl = "https://iptv-isp.nexdecade.com/images/sample_shorts.json?rnd=24368219491642" // Replace with the actual API URL

        AF.request(apiUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { response in

            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let decoder = JSONDecoder()
                        let apiResponse = try decoder.decode(Shorts.self, from: data)
                        // Update the data models with the fetched data
//                        self.apiResponse = apiResponse
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
    
//    func getShorts() -> [Short] {
        
//        APIDataManager.shared.fetchData { (apiResponse, error) in
//            if let apiResponse = apiResponse {
//                // Data models are now populated with the fetched data
//                let shorts = apiResponse.shorts
//                for short in shorts {
//                    // You can now access and use the populated models
//                    print("Description: \(short.description)")
//                    print("Thumbnail URL: \(short.thumbnail)")
//                    // Add more properties as needed
//                }
//            } else if let error = error {
//                // Handle the error
//                print("Error: \(error.localizedDescription)")
//            }
//        }
        
//        return apiResponse?.shorts ?? []
//    }
    
//    func setShorts() -> [Short] {
//        APIDataManager.shared.fetchData { (apiResponse, error) in
//            if let apiResponse = apiResponse {
//                // Data models are now populated with the fetched data
//                let shorts = apiResponse.shorts
////                for short in shorts {
////                    // You can now access and use the populated models
////                    print("Description: \(short.description)")
////                    print("Thumbnail URL: \(short.thumbnail)")
////                    // Add more properties as needed
////                }
//            } else if let error = error {
//                // Handle the error
//                print("Error: \(error.localizedDescription)")
//            }
//        }
//    }
}


