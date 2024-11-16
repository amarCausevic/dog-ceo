import Foundation
import Alamofire

class BreedDetailsViewModel: ObservableObject{
    let apiService = APIService()
    @Published var breadImage: BreedImageModel?
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    func getBreedRandomImage(breedName: String) {
        let path = "/breed/\(breedName)/images/random"

        apiService.fetchData(path: path) { (result: Result<BreedImageModel, AFError>) in
            switch result {
            case .success(let model):
                print("Error: \(model)")
                self.breadImage = model
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
