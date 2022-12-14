//
//  URLComponent.swift


import Foundation

extension URLComponents {
  mutating func setQueryItems(parameters: [String: Any]) {
    self.queryItems = parameters.map{ URLQueryItem(name: $0.key, value: "\($0.value)") }
  }
}
