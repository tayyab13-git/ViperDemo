//
//  QuoteListInteractor.swift


protocol QuoteListInteracting {
  func fetchQuotes(completion: @escaping(Result<[QuoteModel], NetworkError>) -> Void)
}

class QuoteListInteractor {
  private let quoteClient: QuoteClient
  
    init(quoteClient: QuoteClient ) {
    self.quoteClient = quoteClient
  }
   
}

extension QuoteListInteractor: QuoteListInteracting {
  func fetchQuotes(completion: @escaping (Result<[QuoteModel], NetworkError>) -> Void) {
    quoteClient.fetchQuotes { result in
      completion(result)
    }
  }
}
