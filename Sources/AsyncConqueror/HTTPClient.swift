//
//  HTTPClient.swift
//  FoxApp
//
//  Created by Tigran Gishyan on 24.07.22.
//

import Foundation

@available(iOS 15.0.0, *)
public protocol HTTPClient {
    func sendRequest<T: Decodable>(endPoint: Endpoint, responseModel: T.Type) async throws -> T
}

@available(iOS 15.0, *)
public extension HTTPClient {
    func sendRequest<T: Decodable>(
        endPoint: Endpoint,
        responseModel: T.Type
    ) async throws -> T {
        var urlComponents = URLComponents()
        urlComponents.host = endPoint.host
        urlComponents.scheme = endPoint.scheme
        urlComponents.path = endPoint.path
        
        // Cannot create the url from given prerequisites
        guard let url = urlComponents.url else {
            throw error(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method.rawValue
        request.allHTTPHeaderFields = endPoint.header
        
        if let body = endPoint.body {
            // TODO: - Use jsondecoder instead or both
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        
        // MARK: - This initializer is awailable from 15.0
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse else {
            throw error(.noResponse)
        }
        
        switch response.statusCode {
        case 200...299:
            guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                throw error(.decode)
            }
            return decodedResponse
        case 401:
            throw error(.unauthorized)
        default:
            throw error(.unexpectedStatusCode)
        }
    }
    
    private func error(_ error: RequestError) -> RequestError {
        return error
    }
}
