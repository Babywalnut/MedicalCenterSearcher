//
//  CenterInfoViewController.swift
//  MedicalCenterSearcher
//
//  Created by 김민성 on 2022/10/14.
//

import RxCocoa
import RxSwift
import SnapKit
import Then

class CenterInfoViewController: UIViewController {

  private let centerInfoContainerView = CenterInfoContainerView()

  override func viewDidLoad() {
    super.viewDidLoad()

    self.view.backgroundColor = .systemBackground
    layout()
  }

  private func layout() {
    self.view.addSubview(self.centerInfoContainerView)

    self.centerInfoContainerView.snp.makeConstraints {
      $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
      $0.leading.bottom.trailing.equalToSuperview()
    }
  }
}
