import Foundation

protocol HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError>
}

extension HTTPClient {
    func sendRequest<T: Decodable>( endpoint: Endpoint, responseModel: T.Type
    ) async -> Result<T, RequestError> {
        
        if !Reachability.isConnectedToNetwork() {
            return .failure(.noConnection)
        }
        
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.baseURL
        urlComponents.path = endpoint.path
        urlComponents.queryItems = endpoint.queryItems
        
        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.methodName
        request.allHTTPHeaderFields = endpoint.header
        
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                let json = String(data: data, encoding: String.Encoding.utf8)
                return .failure(.noResponse)
            }
            switch response.statusCode {
            case 200...299:
                do {
                    let decodedResponse = try JSONDecoder().decode(responseModel, from: data)
                    return .success(decodedResponse)
                } catch let jsonError as NSError {
                    print("JSON decode failed: \(jsonError)")
                    return .failure(.decode)
                }
            case 400:
                 let json = String(data: data, encoding: String.Encoding.utf8)
                guard let decodedResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) else {
                    return .failure(.decode)
                }
                return .failure(.badRequest(decodedResponse.message))
            case 401:
                guard let decodedResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) else {
                    return .failure(.decode)
                }
                return .failure(.unauthorized(decodedResponse.message.first ?? ""))
            case 404:
                guard let decodedResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) else {
                    return .failure(.decode)
                }
                return .failure(.notFound(decodedResponse.message.first ?? ""))
            case 500:
                guard let decodedResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) else {
                    return .failure(.decode)
                }
                return .failure(.internalServer(decodedResponse.message.first ?? ""))
            default:
                return .failure(.unknown)
            }
        } catch {
            return .failure(.unknown)
        }
    }
}
