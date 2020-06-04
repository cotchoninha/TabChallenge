import Foundation

final class NetworkOperations {
    
    typealias projectsResponse = ( _ projects: Projects?, _ error: Error?) -> Void
    typealias imageDataResponse = (_ data: Data?, _ error: Error?) -> ()
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    private let caseStudiesUrl = "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/caseStudies.json"
    
    func requestCaseStudies(completionHandler: @escaping projectsResponse) {
        
        guard let url = URL(string: caseStudiesUrl) else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        session.dataTask(with: request) { data, _, error in
            
            if let error = error {
                completionHandler(nil, error)
                return
            }
            guard let data = data else {
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            do {
                let decodedResponse = try JSONDecoder().decode(Projects.self, from: data)
                
                DispatchQueue.main.async {
                    completionHandler(decodedResponse, nil)
                    
                }
            } catch {
                print(error)
            }
            
        }.resume()
    }
    
    func loadImage(url: String, completion: @escaping imageDataResponse) {
        
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        session.dataTask(with: request) { data, _, error in
            
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            DispatchQueue.main.async {
                completion(data, nil)
            }
            
        }.resume()
    }
}
