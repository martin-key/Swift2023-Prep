//
//  RequestManager.swift
//  ExamPreparation
//
//  Created by Martin Kuvandzhiev on 2.02.23.
//

import Foundation
import Alamofire

class RequestManager {
    static func fetchData(completion: @escaping((_ error: String?, _ result: [WeatherSnapshot]?) -> Void)) {
        
        AF.request("http://192.168.10.153:15005/dataDay", method: .get).responseDecodable(of: WeatherResult.self) { (weatherDataResponse) in
            
            guard weatherDataResponse.error == nil else {
                completion(weatherDataResponse.error?.localizedDescription, nil)
                return
            }
            
            guard let responseValue = weatherDataResponse.value else {
                completion("No valid response", nil)
                return
            }
            
            completion(nil, responseValue.result)
        }
    }
}
