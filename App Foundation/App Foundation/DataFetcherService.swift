//
//  DataFetcherService.swift
//  App Foundation
//
//  Created by Fabio Fontana on 09/04/25.
//

import Foundation

class AirtableService {
    private let urlString = "https://api.airtable.com/v0/appGAwyQV0p3rEw2N/Table1"
    private let bearerToken = "patgB0i9nJ9TgZfQb.871cf0372b88877f76fdcfc2d4b67b48ba47fd0e83a0357cae5d67af3582e250"
    
    func fetchRecords(completion: @escaping (Result<[Record], Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(bearerToken)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "DataNilError", code: -100001, userInfo: nil)))
                return
            }
            
            do {
                let airtableResponse = try JSONDecoder().decode(AirtableResponse.self, from: data)
                completion(.success(airtableResponse.records))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
