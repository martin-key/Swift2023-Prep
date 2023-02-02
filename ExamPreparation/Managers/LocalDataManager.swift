//
//  LocalDataManager.swift
//  ExamPreparation
//
//  Created by Martin Kuvandzhiev on 2.02.23.
//

import Foundation
import RealmSwift

class LocalDataManager {
    static let realm = try! Realm()
    
    static func updateWeatherData() {
        RequestManager.fetchData { error, result in
            guard error == nil else {
                print("Error in fetching data")
                return
            }
            
            guard let result = result else {
                print("Cannot parse data")
                return
            }
            
            DispatchQueue.main.async {
                LocalDataManager.realm.beginWrite()
                LocalDataManager.realm.add(result, update: .all)
                try? LocalDataManager.realm.commitWrite()
                NotificationCenter.default.post(name: .dataUpdatedNotification, object: nil)
            }
        }
    }
    
    static func getWeatherData() -> [WeatherSnapshot] {
        return Array(LocalDataManager.realm.objects(WeatherSnapshot.self).sorted(byKeyPath: "time", ascending: false))
    }
}
