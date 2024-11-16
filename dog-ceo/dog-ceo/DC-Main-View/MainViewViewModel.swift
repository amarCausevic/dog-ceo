import Alamofire
import Foundation

class MainViewViewModel : ObservableObject{
    let apiService = APIService()
    @Published var dogBreeds: [DogTypeListModel] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    func getDogList() {
        sleep(2)
        apiService.fetchData(path: "/breeds/list/all") { (result: Result<DogListModel, AFError>) in
            switch result {
            case .success(let model):
                self.dogBreeds = model.message.map { breed, subtypes in
                    let nonOptionalSubtypes = subtypes.compactMap { $0 }
                    return DogTypeListModel(breed: breed, subtypes: nonOptionalSubtypes)
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
