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
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
        if let data {
            guard let result = try? JSONDecoder().decode(T.self, from: data) else {return}
                completion(result)
            }
        }
        task.resume()
    }
}
