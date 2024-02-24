import RealmSwift
import Combine
import Foundation

class DBManager {
    static let shared = DBManager()

    private var cancellables = Set<AnyCancellable>()
    private var realm: Realm?

    private init() {
        // Open the Realm asynchronously
        Realm.asyncOpen(configuration: Realm.Configuration()) { result in
            switch result {
            case .success(let realm):
                self.realm = realm
            case .failure(let error):
                // Handle error
                print("Failed to open Realm: \(error)")
            }
        }
    }

    func add<T: Object>(object: T) {
        guard let realm = realm else {
            print("Realm not initialized.")
            return
        }
        DispatchQueue(label: "realm-background").async {
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
        guard let realm = realm else {
            print("Realm not initialized.")
            return
        }
        DispatchQueue(label: "realm-background").async {
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
        guard let realm = realm else {
            print("Realm not initialized.")
            return
        }
        DispatchQueue(label: "realm-background").async {
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
