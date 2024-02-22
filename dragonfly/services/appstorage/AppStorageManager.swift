//
//  AppStorageManager.swift
//  firefly
//
//  Created by Na Ran on 22/02/2024.
//

import Foundation

enum AppStorageKeys : String{
    case isLoggedIn,userId
    
}

final class AppStorageManager {
    static let shared = AppStorageManager()
    
    private init() {}
    
    func getValue<T>(_ key: AppStorageKeys, defaultValue: T) -> T {
        UserDefaults.standard.object(forKey: key.rawValue) as? T ?? defaultValue
    }
        
    func setValue<T>(_ value: T, forKey key: AppStorageKeys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    // LoggedInUser Getter Setter
    
    func getLoggedInUserId() -> String {
        getValue(AppStorageKeys.userId, defaultValue: "none")
    }
    
    func setLoggedInUserId(_ userId: String) {
        setValue(userId, forKey: AppStorageKeys.userId)
    }
    
    
    // Is User Logged In Getter Setter
    
    func isUserLoggedIn() -> Bool {
        getValue(.isLoggedIn, defaultValue: false)
    }
       
    func setUserLoggedIn(_ status: Bool) {
        setValue(status, forKey: .isLoggedIn)
    }
    
    
}
