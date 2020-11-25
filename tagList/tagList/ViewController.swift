//
//  ViewController.swift
//  tagList
//
//  Created by 강병우 on 2020/11/19.
//

import UIKit

import Then
import SnapKit
import ReusableKit

class ViewController: UIViewController {
  
  // MARK: - Constants
  
  enum Reusable {
    static let tagCell = ReusableCell<TagCell>()
  }
  
  // MARK: - Property
  
  // 뿌려줄 데이터
  let tagList: [String] = [
    "개발자아라찌",
    "Then",
    "SnapKit",
    "RxSwift",
    "Viper",
    "Swift",
    "UIKit",
    "Foundation",
    "ReactorKit"
  ]
  
  // MARK: - View
  
  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then {
    let layout = LeftAlignedCollectionViewFlowLayout()
    layout.minimumLineSpacing = 3
    layout.minimumInteritemSpacing = 3
    layout.sectionInset = UIEdgeInsets(top: 5, left: 2, bottom: 5, right: 2)
    
    $0.isScrollEnabled = false
    $0.collectionViewLayout = layout
    $0.backgroundColor = .systemBackground
    $0.register(Reusable.tagCell)
  }

  // MARK: - View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.collectionView.delegate = self
    
    self.view.addSubview(collectionView)
    
    setConstraint()
    self.collectionView.dataSource = self
  }

  override func loadView() {
    let view = UIView()
    view.backgroundColor = .systemBackground
    self.view = view
  }
  
  func setConstraint() {
    collectionView.snp.makeConstraints {
      $0.center.width.equalToSuperview()
      $0.height.equalTo(100)
    }
  }
}

extension ViewController: UICollectionViewDataSource {
  // cell갯수
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return tagList.count
  }
  
  // cell 선언
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(Reusable.tagCell, for: indexPath)
    
    cell.tagLabel.text = tagList[indexPath.item]
    
    return cell
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
  // 셀 크기설정
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let label = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.text = tagList[indexPath.item]
        $0.sizeToFit()
    }
    let size = label.frame.size
    
    return CGSize(width: size.width + 16, height: size.height + 10)
  }
}
