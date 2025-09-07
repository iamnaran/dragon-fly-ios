import RealmSwift
import Combine
import Foundation

class DBManager {
    static let shared = DBManager()
    
    private var realm: Realm?
    
    private init() {
        do {
            let config = Realm.Configuration(
                schemaVersion: 1, // increment when models change
                migrationBlock: { migration, oldSchemaVersion in
                    if oldSchemaVersion < 1 {
                        // handle migration if needed
                    }
                },
                deleteRealmIfMigrationNeeded: false
            )
            Realm.Configuration.defaultConfiguration = config
            realm = try Realm(configuration: config)
            print("Realm initialized at: \(Realm.Configuration.defaultConfiguration.fileURL?.absoluteString ?? "")")
        } catch {
            print("Failed to open Realm: \(error)")
        }
    }
    
    // MARK: - Add single object safely
    func add<T: Object>(_ object: T, updateIfExists: Bool = true) {
        guard let realm = self.realm else {
            print("Realm not initialized.")
            return
        }
        
        do {
            try realm.write {
                if updateIfExists {
                    realm.add(object, update: .modified)
                } else {
                    // Only insert if primary key doesn't exist
                    if let primaryKey = T.primaryKey(),
                       realm.object(ofType: T.self, forPrimaryKey: object.value(forKey: primaryKey)) == nil {
                        realm.add(object)
                    } else if T.primaryKey() == nil {
                        realm.add(object)
                    }
                }
            }
        } catch {
            print("Error adding object: \(error)")
        }
    }
    
    // MARK: - Insert multiple objects safely
    func insertAll<T: Object>(_ objects: [T], updateIfExists: Bool = true) {
        guard let realm = self.realm else {
            print("Realm not initialized.")
            return
        }
        
        do {
            try realm.write {
                if updateIfExists {
                    realm.add(objects, update: .modified) // bulk upsert
                } else {
                    for obj in objects {
                        if let primaryKey = T.primaryKey(),
                           realm.object(ofType: T.self, forPrimaryKey: obj.value(forKey: primaryKey)) == nil {
                            realm.add(obj)
                        } else if T.primaryKey() == nil {
                            realm.add(obj)
                        }
                    }
                }
            }
        } catch {
            print("Error inserting objects: \(error)")
        }
    }
    
    // MARK: - Delete object
    func delete<T: Object>(_ object: T) {
        guard let realm = self.realm else { return }
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch {
            print("Error deleting object: \(error)")
        }
    }
    
    // MARK: - Fetch all objects of a type
    func getAllObjects<T: Object>(_ type: T.Type) -> [T] {
        guard let realm = self.realm else { return [] }
        let results = realm.objects(type)
        return Array(results)
    }
    
    // MARK: - Clear all objects of a type
    func deleteAll<T: Object>(_ type: T.Type) {
        guard let realm = self.realm else { return }
        do {
            try realm.write {
                realm.delete(realm.objects(type))
            }
        } catch {
            print("Error deleting objects: \(error)")
        }
    }
}
