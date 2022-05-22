//
//  URLSessionProtocolMock.swift
//  NYT AppTests
//
//  Created by Nour Araar on 5/22/22.
//

import Foundation
@testable import NYT_App

class URLSessionProtocolMock: URLSessionProtocol {

  var dataForDelegateReturnValue: (Data, URLResponse)?
  var dataForDelegateRequest: URLRequest?
  var dataForDelegateError: Error?

  func data(for request: URLRequest,
            delegate: URLSessionTaskDelegate?)
  async throws -> (Data, URLResponse) {

    if let error = dataForDelegateError {
      throw error
    }

    dataForDelegateRequest = request

    guard let dataForDelegateReturnValue =
            dataForDelegateReturnValue else {
              fatalError()
            }
    return dataForDelegateReturnValue
  }
}
