//
//  OnboardingViewController.swift
//  AutoLayout_Tutorial
//
//  Created by Julio Hernandez-Duran on 10/1/17.
//  Copyright © 2017 MobileDevs. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 0
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.dataSource = self
    cv.delegate = self
    cv.backgroundColor = .white
    cv.isPagingEnabled = true
    cv.translatesAutoresizingMaskIntoConstraints = false
    return cv
  }()
  
  let controlStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    stackView.alignment = .center
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  let pageControl: UIPageControl = {
    let pc = UIPageControl()
    pc.pageIndicatorTintColor = .lightGray
    pc.currentPageIndicatorTintColor = .black
    pc.numberOfPages = 4
    pc.translatesAutoresizingMaskIntoConstraints = false
    return pc
  }()
  
  let previousButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("PREV", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let nextButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("NEXT", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let cellId = "PageCell"
  
  let pages: [Page] = {
    let firstPage = Page(title: "Join us today in our fun and games!",
                         message: "\n\n\nAre you ready for loads of fun? Don't wait any longer! We hope to see you in our stores soon.",
                         imageName: "")
    let secondPage = Page(title: <#T##String#>,
                          message: <#T##String#>,
                          imageName: <#T##String#>)
    let thirdPage = Page(title: <#T##String#>,
                         message: <#T##String#>,
                         imageName: <#T##String#>)
    let fourthPage = Page(title: <#T##String#>,
                          message: <#T##String#>,
                          imageName: <#T##String#>)
    return [firstPage, secondPage, thirdPage, fourthPage]
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    collectionView.register(PageCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    
    view.addSubview(collectionView)
    view.addSubview(controlStackView)
    
    controlStackView.addArrangedSubview(previousButton)
    controlStackView.addArrangedSubview(pageControl)
    controlStackView.addArrangedSubview(nextButton)
    
    setupLayout()
  }
  
  private func setupLayout() {
    collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    collectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
    
    controlStackView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
    controlStackView.bottomAnchor.constraint(greaterThanOrEqualTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    controlStackView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    controlStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
  }

}

// MARK: - Collection view data source
extension OnboardingViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return pages.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCollectionViewCell
    
    cell.page = pages[indexPath.row]
    
    return cell
  }
}

// MARK: - Collection view delegate
extension OnboardingViewController: UICollectionViewDelegate {
  
}

// MARK: - Collection view delegate flow layout
extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: self.view.frame.width, height: self.view.frame.height)
  }
}
