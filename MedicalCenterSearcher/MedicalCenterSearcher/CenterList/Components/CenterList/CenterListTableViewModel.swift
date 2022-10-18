//
//  CenterListTableViewModel.swift
//  MedicalCenterSearcher
//
//  Created by 김민성 on 2022/10/17.
//

import RxCocoa
import RxSwift

class CenterListTableViewModel {

  let centerListData = PublishSubject<[CenterListData]>()
  let cellData: Driver<[CenterListData]>
  let scrollUnderBottom = BehaviorSubject<Int>(value: 1)
  var pageToRequest: Observable<Int>

  private let disposeBag = DisposeBag()

  init() {
    self.cellData = self.centerListData
      .asDriver(onErrorJustReturn: [])

    self.pageToRequest = self.scrollUnderBottom
      .distinctUntilChanged()
  }
}
