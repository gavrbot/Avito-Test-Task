//
//  APICaller.swift
//  Avito Test Task
//
//  Created by Александр Гаврилов on 28.10.2022.
//

import Foundation

struct Contants {
    static let baseUrl = "https://run.mocky.io"
    static let apiVersion = "/v3"
}

enum APIError: Error {
    case failedToGetData
    case failedToDecodeData
}

class APICaller {
    static let shared = APICaller()
    
    func getCompanyWithEmployees(completion: @escaping (Result<Company, Error>) -> Void) {
        guard let url = URL(string: "\(Contants.baseUrl)\(Contants.apiVersion)/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c") else {
            return
        }
        
        var urlRequest = URLRequest(url: url)
        
        if DateChecker.shared.isReloadNeeded() {
            urlRequest.cachePolicy = .reloadIgnoringLocalCacheData
            DateChecker.shared.setCacheTimeDate(date: Date())
        } else {
            urlRequest.cachePolicy = .returnCacheDataDontLoad
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(APIError.failedToGetData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(APIResponse.self, from: data)
                completion(.success(result.company))
            } catch {
                completion(.failure(APIError.failedToDecodeData))
            }
            
        }
        task.resume()
    }
}
