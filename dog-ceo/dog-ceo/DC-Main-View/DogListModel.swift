import Foundation

struct DogListModel: Decodable {
    let message: [String: [String?]]
    let status: String
}
