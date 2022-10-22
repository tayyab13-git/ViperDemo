//
//  NetworkSession.swift


import Foundation

protocol NetworkSession {
  func loadData(resource: APIResourceConfiguration?, completion: @escaping(Result<Data, NetworkError>) -> Void )
}

extension URLSession: NetworkSession {
  func loadData(resource: APIResourceConfiguration?, completion: @escaping (Result<Data, NetworkError>) -> Void) {
    guard let url = try? resource?.asURLRequest()
    else {
      completion(.failure(.badUrl))
      return
    }
    
    let task = self.dataTask(with: url, completionHandler: { (data, response, error) in
      guard let data = data
      else {
        completion(.failure(.generic(error: error!)))
        return
      }
      completion(.success(data))
    })
    task.resume()
  }
}
