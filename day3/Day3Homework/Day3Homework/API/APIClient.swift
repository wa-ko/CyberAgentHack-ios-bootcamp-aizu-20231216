//
//  Test.swift
//  Day3Homework
//
//  Created by 若生優希 on 2024/01/13.
//

import Foundation

struct APIClient {

    private func getAPIKey() -> String? {
        guard let keyFilePath = Bundle.main.path(forResource: "APIKey", ofType: "plist"),
              let keys = NSDictionary(contentsOfFile: keyFilePath),
              let apiKey = keys["APIKey"] as? String else {
            return nil
        }
        return apiKey
    }

    func call(completion: @escaping (Result<Data, Error>) -> Void) {

        guard let apiKey = getAPIKey() else {
            print("API Key not found.")
            return
        }
        let headers = [
            "accept": "application/json",
            "Authorization": "Bearer \(apiKey)"
        ]

        let request = NSMutableURLRequest(
            url: NSURL(string: "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1")! as URL,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: 10.0
        )
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                completion(.failure(error!))
            } else {
                completion(.success(data!))
            }
        })

        dataTask.resume()
    }
}
