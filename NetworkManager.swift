

import Foundation


enum Link {
    
    case employees
    
    var url:URL{
        switch self {
        case.employees:
            return URL(string: "https://dummy.restapiexample.com/api/v1/employees")!
        }
    }
}



final class NetworkManager : ObservableObject {
    init() {}
    
    static let shared = NetworkManager()
    
    @Published var employees = [Employee]()
    
    func fetchEmployees() {
         
        print("try to fetch")
        
        let fetchRequest = URLRequest(url:Link.employees.url)
        
        URLSession.shared.dataTask(with: fetchRequest) { [weak self](data, response, error) -> Void in
            if error != nil {
                print("Erorre in session is not nil")
            } else {
                //получили
                let httpResponse = response as? HTTPURLResponse
                print("status code \(String(describing: httpResponse?.statusCode))")
                
                guard let safeData = data else { return }
                
                if let decoderdQuery = try? JSONDecoder().decode(Query.self, from: safeData){
                    DispatchQueue.main.async {
                        self?.employees = decoderdQuery.data
                    }
                   
                }
                
            }
            
        }.resume()
    }
}
