//
//  APIResourceConfiguration.swift
//

import Foundation

enum HTTPMethod: String {
  case GET = "GET"
  case POST = "POST"
}

protocol APIResourceConfiguration {
  var baseURL: String { get }
  var path: String { get }
  var apiUrl: URL? { get }
  var method: HTTPMethod { get }
  var parameters: [String: Any]? { get }
}

extension APIResourceConfiguration {
  var baseURL: String {
    "https://thesimpsonsquoteapi.glitch.me"
  }
  
  var apiUrl: URL? {
    var urlComponent = URLComponents(string: baseURL)
    urlComponent?.path = path
    
    if method == HTTPMethod.GET {
      urlComponent?.setQueryItems(parameters: parameters ?? [:])
    }
    
    guard let url = urlComponent?.url else {
      return nil
    }
    return url
  }
}

extension APIResourceConfiguration {
  func asURLRequest() throws -> URLRequest? {
    guard let apiUrl = apiUrl else { return nil }
    
    var urlRequest = URLRequest(url: apiUrl)
    urlRequest.httpMethod = method.rawValue
  
    if method == HTTPMethod.POST {
      urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters ?? [], options: .prettyPrinted)
    }
     return urlRequest
  }
}
