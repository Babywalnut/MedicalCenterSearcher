//
//  NetworkManager.swift
//  MedicalCenterSearcher
//
//  Created by 김민성 on 2022/10/14.
//

import Alamofire
import RxSwift

struct NetworkManager {

  func fetchAllCenterData(page: Int) -> Single<Result<CenterInfo,APINetworkError>> {
    return Single.create { observer -> Disposable in
      AF.request(NetworkRequestRouter.fetchAllCenterDate(page: page))
        .validate()
        .response { response in
          switch response.result {
          case .success(let data):
            guard let data = data else { return }
            if let response = convertedResponse(data: data) {
              observer(.success(.success(response)))
            } else {
              observer(.success(.failure(APINetworkError.decodingError)))
            }
          case .failure(_):
            observer(.success(.failure(APINetworkError.networkError)))
          }
        }
      return Disposables.create()
    }
  }

    func convertedResponse(data: Data) -> CenterInfo? {
        return try? JSONDecoder().decode(CenterInfo.self, from: data)
  }
}
