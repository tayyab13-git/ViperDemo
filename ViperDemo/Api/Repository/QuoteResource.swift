//
//  QuoteResource.swift


enum QuoteResource: APIResourceConfiguration {
  case list(count: Int)
  
  var method: HTTPMethod {
    HTTPMethod.GET
  }
  
  var path: String {
    "/quotes"
  }
  
  var parameters: [String : Any]? {
    switch self {
    case .list(let count):
      return ["count" : count]
        
    }
  }
}
