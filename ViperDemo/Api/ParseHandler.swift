//
//  ParseHandler.swift


import Foundation

protocol ParseHandlerProviding {
  func parse<T: Decodable>(data: Data) -> Result<T, NetworkError>
}

class ParseHandler: ParseHandlerProviding {
  func parse<T: Decodable>(data: Data) -> Result<T, NetworkError> {
    guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
      return .failure(.badJson)
    }
    
    return .success(decodedData)
  }
}
