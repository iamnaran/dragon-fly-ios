import RealmSwift
import Combine
import Foundation

class DBManager {
    static let shared = DBManager()

    private var realm: Realm?

    private init() {
           do {
               let config = Realm.Configuration(
                   schemaVersion: 1, // increment this when you change your models
                   migrationBlock: { migration, oldSchemaVersion in
                       if oldSchemaVersion < 1 {
                           // Realm will automatically detect new properties and add them
                           // You can also handle custom migration logic here if needed
                       }
                   },
                   deleteRealmIfMigrationNeeded: false // Set true if you want to reset DB on incompatible changes
               )

               Realm.Configuration.defaultConfiguration = config
               realm = try Realm(configuration: config)
               print("Realm initialized at: \(Realm.Configuration.defaultConfiguration.fileURL?.absoluteString ?? "")")
           } catch {
               print("Failed to open Realm: \(error)")
           }
       }

    func add<T: Object>(object: T) {
        DispatchQueue.main.async {
            guard let realm = self.realm else {
                print("Realm not initialized.")
                return
            }
            do {
                try realm.write {
                    realm.add(object)
                }
            } catch {
                print("Error adding object to Realm: \(error)")
            }
        }
    }

    func delete<T: Object>(object: T) {
        DispatchQueue.main.async {
            guard let realm = self.realm else {
                print("Realm not initialized.")
                return
            }
            do {
                try realm.write {
                    realm.delete(object)
                }
            } catch {
                print("Error deleting object from Realm: \(error)")
            }
        }
    }

    func insertAll<T: Object>(objects: [T]) {
        DispatchQueue.main.async {
            guard let realm = self.realm else {
                print("Realm not initialized.")
                return
            }
            do {
                try realm.write {
                    realm.add(objects)
                }
            } catch {
                print("Error inserting objects to Realm: \(error)")
            }
        }
    }
    
    // MARK: - Fetch all objects of a type
    func getAllObjects<T: Object>(_ type: T.Type) -> [T] {
        guard let realm = self.realm else { return [] }
        let results = realm.objects(type)
        return Array(results) 
    }
}
