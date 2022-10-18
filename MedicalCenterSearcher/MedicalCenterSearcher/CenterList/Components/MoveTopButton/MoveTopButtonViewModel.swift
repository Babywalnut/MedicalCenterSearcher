//
//  MoveTopButtonViewModel.swift
//  MedicalCenterSearcher
//
//  Created by 김민성 on 2022/10/18.
//

import RxCocoa
import RxSwift

class MoveTopButtonViewModel {
  let buttonClicked: PublishSubject<Void>

  init() {
    self.buttonClicked = PublishSubject<Void>()
  }
}
