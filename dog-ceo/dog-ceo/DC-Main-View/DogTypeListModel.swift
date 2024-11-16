struct DogTypeListModel: Identifiable, Decodable, Hashable {
    var id: String { breed }
    let breed: String
    let subtypes: [String]?
}
