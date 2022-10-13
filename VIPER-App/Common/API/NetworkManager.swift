//
//  NetworkManager.swift
//  VIPER-App
//
//  Created by Fatih Gursoy on 12.10.2022.
//

import Foundation

protocol NetworkProtocol: AnyObject {
    func fetchData<T: Decodable>(endPoint: String, completion: @escaping (T) -> Void)
}

class NetworkManager: NetworkProtocol {
    
    func fetchData<T: Decodable>(endPoint: String, completion: @escaping (T) -> Void) {
        
        guard let url = URL(string: endPoint) else { return }
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in

            if error != nil {
                print(error?.localizedDescription as Any)
            } else {
                guard let data else { return }
                
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(result)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}
