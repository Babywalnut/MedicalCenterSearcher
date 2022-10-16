//
//  CenterListViewController.swift
//  MedicalCenterSearcher
//
//  Created by 김민성 on 2022/10/14.
//

import RxCocoa
import RxSwift
import SnapKit
import Then

class CenterListViewController: UIViewController {

  let centerList = CenterListTableView()
  let moveTopButton = MoveTopButton()

  override func viewDidLoad() {
    super.viewDidLoad()

    self.configure()
    self.layout()
  }

  private func configure() {
    self.view.backgroundColor = .systemBackground
  }

  private func layout() {
    [
      self.centerList,
      self.moveTopButton
    ].forEach {
      self.view.addSubview($0)
    }

    self.centerList.snp.makeConstraints {
      $0.top.leading.bottom.trailing.equalToSuperview()
    }

    self.moveTopButton.snp.makeConstraints {
      $0.bottom.trailing.equalToSuperview().inset(30)
    }
  }
}
