import Alamofire

class APIService {
    
    func fetchData<T: Decodable>(path: String, completion: @escaping (Result<T, AFError>) -> Void) {
        let URL = "\(Config.baseURL)\(path)"
        
        print("\(URL) this is URL")
        AF.request(URL)
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let model):
                    completion(.success(model))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
