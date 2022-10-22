//
//  NetworkError.swift

import Foundation

enum NetworkError: Error {
  case badUrl
  case badJson
  case generic(error: Error)
  
  var description: String {
    switch self {
    case .badUrl:
      return "bad url."
    case .badJson:
      return "bad json."
    case .generic(let error):
      return error.localizedDescription
    }
  }
}
