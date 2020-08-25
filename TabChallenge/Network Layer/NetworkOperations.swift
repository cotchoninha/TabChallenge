import Foundation

protocol NetworkOperationsProtocol: AnyObject {
    func requestCaseStudies(completionHandler: @escaping (Result<Projects, Error>) -> Void)
    func loadImage(url: String, completion: @escaping (Result<Data, Error>) -> Void)
}

protocol URLSessionType: AnyObject {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionType {}

final class NetworkOperations: NetworkOperationsProtocol {
    
    typealias ProjectsResponse = (Result<Projects, Error>) -> Void
    typealias ImageDataResponse = (Result<Data, Error>) -> Void
    private let session: URLSessionType
    
    init(session: URLSessionType = URLSession.shared) {
        self.session = session
    }
    
    private let caseStudiesUrl = "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/caseStudies.json"
    
    func requestCaseStudies(completionHandler: @escaping ProjectsResponse) {
        
        guard let url = URL(string: caseStudiesUrl) else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        session.dataTask(with: request) { data, _, error in
            
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            guard let data = data else {
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            do {
                let decodedResponse = try JSONDecoder().decode(Projects.self, from: data)
                
                DispatchQueue.main.async {
                    completionHandler(.success(decodedResponse))
                    
                }
            } catch {
                print(error)
            }
            
        }.resume()
    }
    
    func loadImage(url: String, completion: @escaping ImageDataResponse) {
        
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        session.dataTask(with: request) { data, _, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            DispatchQueue.main.async {
                completion(.success(data))
            }
            
        }.resume()
    }
}
