//
//  DateChecker.swift
//  Avito Test Task
//
//  Created by Александр Гаврилов on 02.11.2022.
//

import Foundation

class DateChecker {
    static let shared = DateChecker()
    
    private var storage = UserDefaults.standard
    
    private var storageKey = "lastCacheTimeKey"
    
    private let SECONDS_IN_HOUR: Double = 3600

    func setCacheTimeDate(date: Date) {
        storage.set(date, forKey: storageKey)
    }
    
    func isReloadNeeded() -> Bool {
        guard let lastDate = UserDefaults.standard.object(forKey: storageKey) as? Date else {
            return true
        }
        return Date().timeIntervalSince(lastDate) > SECONDS_IN_HOUR
    }
}
