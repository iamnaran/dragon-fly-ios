import Foundation

enum AppStorageKeys: String {
    case isLoggedIn, loggedInUser
}

final class AppStorageManager {
    
    static let shared = AppStorageManager()
    private let defaults = UserDefaults.standard
    
    private init() {}
    
    // MARK: - Generic Get/Set
    func getValue<T>(_ key: AppStorageKeys, defaultValue: T) -> T {
        defaults.object(forKey: key.rawValue) as? T ?? defaultValue
    }
    
    func setValue<T>(_ value: T, forKey key: AppStorageKeys) {
        defaults.set(value, forKey: key.rawValue)
    }
    
    
    // MARK: - User Login Status
    var isUserLoggedIn: Bool {
        get { getValue(.isLoggedIn, defaultValue: false) }
        set { setValue(newValue, forKey: .isLoggedIn) }
    }
    
    var loggedInUserId: String {
          get { getLoggedInUser()?.id.description ?? "" }
    }
      
    var loggedInUserToken: String {
          get { getLoggedInUser()?.accessToken ?? "" }
    }
    
    // MARK: - Logged In User Object
    func setLoggedInUser(_ user: UserResponse) {
        do {
            let data = try JSONEncoder().encode(user)
            defaults.set(data, forKey: AppStorageKeys.loggedInUser.rawValue)
            defaults.set(true, forKey: AppStorageKeys.isLoggedIn.rawValue)
        } catch {
            print("Failed to encode user: \(error)")
        }
    }
    
    func getLoggedInUser() -> UserResponse? {
        guard let data = defaults.data(forKey: AppStorageKeys.loggedInUser.rawValue) else { return nil }
        do {
            return try JSONDecoder().decode(UserResponse.self, from: data)
        } catch {
            print("Failed to decode user: \(error)")
            return nil
        }
    }
    
    func clearLoggedInUser() {
        defaults.removeObject(forKey: AppStorageKeys.loggedInUser.rawValue)
        defaults.set(false, forKey: AppStorageKeys.isLoggedIn.rawValue)
        isUserLoggedIn = false
    }
}
