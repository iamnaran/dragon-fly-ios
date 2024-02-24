import RealmSwift
import Combine
import Foundation

class DBManager {
    static let shared = DBManager()

    private var realm: Realm?

    private init() {
        // Open the Realm synchronously on the main thread
        do {
            realm = try Realm()
        } catch {
            // Handle error
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
}
