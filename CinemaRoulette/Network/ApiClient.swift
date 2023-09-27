//
//  ApiClient.swift
//  CinemaRoulette
//
//  Created by Евгений Испольнов on 27.09.2023.
//

import Foundation

public final class ApiClient {
    
    public func request<T: Decodable>(urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else { throw ApiError.invalidURL }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("f35b2b5d-5bda-4ec3-9d8e-17d9110b92a8", forHTTPHeaderField: "X-API-KEY")
        request.httpMethod = "GET"
        let data = try await asyncData(with: request)
        return try JSONDecoder().decode(T.self, from: data)
    }
            
    private func asyncData(with request: URLRequest) async throws -> Data {
        try await withCheckedThrowingContinuation { (con: CheckedContinuation<Data, Error>) in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                if let error = error {
                    con.resume(throwing: error)
                } else if let data = data {
                    con.resume(returning: data)
                } else {
                    con.resume(returning: Data())
                }
            }
            
            task.resume()
        }
    }
    
}

extension ApiClient {
    
    enum ApiError: Error {
        case invalidURL
        case missingData
    }
    
}
