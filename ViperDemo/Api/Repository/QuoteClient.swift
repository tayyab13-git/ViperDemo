//
//  QuoteClient.swift


protocol QuoteRepository {
  func fetchQuotes(completion: @escaping (Result<[QuoteModel], NetworkError>) -> Void )
}

class QuoteClient {
  private var apiClient: APIClientProviding
  
  init(apiClient: APIClientProviding) {
    self.apiClient = apiClient
  }
}

extension QuoteClient: QuoteRepository {
  func fetchQuotes(completion: @escaping (Result<[QuoteModel], NetworkError>) -> Void) {
    let resource: QuoteResource = .list(count: 30)
    apiClient.loadData(from: resource, type: [QuoteModel].self) { result in
      completion(result)
    }
  }
}
