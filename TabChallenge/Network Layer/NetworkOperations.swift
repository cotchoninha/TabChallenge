import Foundation

final class NetworkOperations {
    
    func requestCaseStudies() {
        let caseStudiesUrl = "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/caseStudies.json"
        
        guard let url = URL(string: caseStudiesUrl) else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
        do {
            let decodedResponse = try JSONDecoder().decode(Projects.self, from: data)
            // we have good data – go back to the main thread
            print(decodedResponse)
        } catch {
            print(error)
        }
        
    }.resume()
    
    
}
}
