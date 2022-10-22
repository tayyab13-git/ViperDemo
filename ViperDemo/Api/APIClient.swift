//
//  APIClient.swift

import Foundation

protocol APIClientProviding {
  func loadData<T: Codable>(from resource: APIResourceConfiguration?, type: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void )
}

class APIClient {
  let parser: ParseHandlerProviding
  let session: NetworkSession
  
  init(parser: ParseHandlerProviding, session: URLSession = URLSession.shared) {
    self.parser = parser
    self.session = session
  }
}

extension APIClient: APIClientProviding {
  func loadData<T: Codable>(from resource: APIResourceConfiguration?, type: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
    session.loadData(resource: resource) { result in
      switch result {
      case .success(let data):
        completion(self.parser.parse(data: data))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
}
