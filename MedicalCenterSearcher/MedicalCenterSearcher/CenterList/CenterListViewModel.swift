//
//  CenterListViewModel.swift
//  MedicalCenterSearcher
//
//  Created by 김민성 on 2022/10/14.
//

import RxCocoa
import RxSwift

class CenterListViewModel {

  let centerListTableViewModel: CenterListTableViewModel
  private let disposeBag = DisposeBag()

  init(useCase: CenterUseCase) {
    self.centerListTableViewModel = CenterListTableViewModel()

    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?

    let result = self.centerListTableViewModel.pageToRequest
      .map(useCase.fetchCenterListData(page:))
      .flatMap { $0 }
      .map(useCase.centerResponse)
      .filter { $0 != nil }

    let sortedResult = result
      .map { centerInfo -> [CenterModel] in
        useCase.centerModel(result: centerInfo!)
      }
      .map { data -> [CenterModel] in
        var models: [CenterModel] = []
        data.forEach { centerModel in
          var model = centerModel
          model.convertedUpdatedAt = dateFormatter.date(from:centerModel.updatedAt) ?? Date()
          models.append(model)
        }

        models.sorted {
          $0.convertedUpdatedAt! < $1.convertedUpdatedAt!
        }

        useCase.storeModels(models: models)

        return useCase.centerData
      }

    sortedResult
      .map(useCase.centerListCellData)
      .bind(to: self.centerListTableViewModel.centerListData)
      .disposed(by: self.disposeBag)
  }
}
