import Foundation

struct Config {
    static var baseURL: String {
        return Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? "https://dog.ceo/api"
    }
}
