//
//  NetworkRequestRouter.swift
//  MedicalCenterSearcher
//
//  Created by 김민성 on 2022/10/16.
//

import Foundation

import Alamofire

enum NetworkRequestRouter: URLRequestConvertible {

  case fetchAllCenterDate

  private var baseURLString: String {
    return "https://api.odcloud.kr/api/15077586/v1"
  }

  private var path: String {
    switch self {
    case .fetchAllCenterDate:
      return "/centers?page=1&perPage=10&serviceKey=\(APIKey.centerAPIKey)"
    }
  }

  private var HTTPMethod: Alamofire.HTTPMethod {
    return .get
  }

  func asURLRequest() throws -> URLRequest {
    let url = try (self.baseURLString + self.path).asURL()
    var request = URLRequest(url: url)
    request.httpMethod = self.HTTPMethod.rawValue
    request.cachePolicy = .reloadIgnoringCacheData

    switch self {
    case .fetchAllCenterDate:
      return request
    }
  }
}
