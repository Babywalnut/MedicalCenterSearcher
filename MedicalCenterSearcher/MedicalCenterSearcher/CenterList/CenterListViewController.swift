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

class CenterListViewController: UIViewController, UITableViewDelegate {

  let networkManager = NetworkManager()
  let centerList = CenterListTableView()
  let moveTopButton = MoveTopButton()
  let centerListViewModel: CenterListViewModel
  let useCase: CenterUseCase

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    self.useCase = CenterUseCase(network: self.networkManager)
    self.centerListViewModel = CenterListViewModel(useCase: self.useCase)

    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {

    super.viewDidLoad()

    self.configure()
    self.layout()
  }

  private func configure() {
    self.view.backgroundColor = .systemBackground
    self.bind()
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

  private func bind() {
    self.centerList.bind(viewModel: self.centerListViewModel.centerListTableViewModel)
    }
}
