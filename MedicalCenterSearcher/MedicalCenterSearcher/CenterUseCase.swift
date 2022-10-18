//
//  CenterUseCase.swift
//  MedicalCenterSearcher
//
//  Created by 김민성 on 2022/10/14.
//

import RxCocoa
import RxSwift

class CenterUseCase {

  let network: NetworkManager
  var centerData: [CenterModel]

  init(network: NetworkManager) {
    self.network = network
    self.centerData = []
  }

  func fetchCenterListData(page: Int) -> Single<Result<CenterInfo, APINetworkError>> {
    return network.fetchAllCenterData(page: page)
  }

  func centerResponse(result: Result<CenterInfo, APINetworkError>) -> CenterInfo? {
    guard case .success(let value) = result else {
      return nil
    }
    return value
  }

  func centerModel(result: CenterInfo) -> [CenterModel] {
    return result.data
  }

  func storeModels(models: [CenterModel]) {
    self.centerData.append(contentsOf: models)
  }

  func centerListCellData(models: [CenterModel]) -> [CenterListData] {
    var result: [CenterListData] = []
    models.forEach {
      let centerListData = CenterListData(
        centerName: $0.centerName,
        facilityName: $0.facilityName,
        phoneNumber: $0.phoneNumber,
        updateAt: $0.convertedUpdatedAt!,
        address: $0.address
      )
      result.append(centerListData)
    }
    return result
  }
}

