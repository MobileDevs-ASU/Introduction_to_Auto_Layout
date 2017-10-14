//
//  OnboardingViewController.swift
//  AutoLayout_Tutorial
//
//  Created by Julio Hernandez-Duran on 10/1/17.
//  Copyright © 2017 MobileDevs. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
  
  lazy var onboardingCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 0
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor = .white
    collectionView.isPagingEnabled = true
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.contentInsetAdjustmentBehavior = .never
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  
  let navigationStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    stackView.alignment = .center
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  lazy var pageControl: UIPageControl = {
    let pc = UIPageControl()
    pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
    pc.currentPageIndicatorTintColor = .mainPink
    pc.numberOfPages = self.pages.count
    pc.translatesAutoresizingMaskIntoConstraints = false
    return pc
  }()
  
  let previousButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("PREV", for: .normal)
    button.setTitleColor(.gray, for: .normal)
    button.addTarget(self, action: #selector(onPreviousButtonTapped), for: .touchUpInside)
//    button.backgroundColor = .blue
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let nextButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("NEXT", for: .normal)
    button.setTitleColor(.mainPink, for: .normal)
    button.addTarget(self, action: #selector(onNextButtonTapped), for: .touchUpInside)
//    button.backgroundColor = .green
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let cellId = "PageCell"
  
  private let pages: [Page] = {
    let firstPage = Page(title: "Join us today in our fun and games!",
                         message: "\n\nAre you ready for loads of fun? Don't wait any longer! We hope to see you in our stores soon.",
                         imageName: "bear_first")
    let secondPage = Page(title: "Subscribe and get coupons on our daily events",
                          message: "\n\nGet notified of the savings immediately when we announce them on our website. Make sure to also give us any feedback you have.",
                          imageName: "bear_first")
    let thirdPage = Page(title: "VIP members special services",
                         message: "\n\nJoin the private club of elite customers will get you into select drawings and giveaways.",
                         imageName: "bear_first")
    let fourthPage = Page(title: "Pick from your favorite toys",
                          message: "\n\nWhat are you waiting for? Join us today!",
                          imageName: "bear_first")
    return [firstPage, secondPage, thirdPage, fourthPage]
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    onboardingCollectionView.register(PageCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    
    setupSubviews()
    setupConstraints()
  }
  
  private func setupSubviews() {
    view.addSubview(onboardingCollectionView)
    view.addSubview(navigationStackView)
    
    navigationStackView.addArrangedSubview(previousButton)
    navigationStackView.addArrangedSubview(pageControl)
    navigationStackView.addArrangedSubview(nextButton)
  }
  
  private func setupConstraints() {
    onboardingCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
    onboardingCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    onboardingCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    onboardingCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
    
    navigationStackView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
    navigationStackView.bottomAnchor.constraint(greaterThanOrEqualTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    navigationStackView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
    navigationStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
  }
  
  // MARK: - Actions
  
  @objc private func onPreviousButtonTapped() {
    var indexPath: IndexPath
    
    guard pageControl.currentPage != 0 else {
      indexPath = IndexPath(item: pageControl.numberOfPages - 1, section: 0)
      onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
      pageControl.currentPage = pageControl.numberOfPages
      return
    }
    
    indexPath = IndexPath(item: pageControl.currentPage - 1, section: 0)
    onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    pageControl.currentPage -= 1
  }
  
  @objc private func onNextButtonTapped() {
    var indexPath: IndexPath
    
    guard pageControl.currentPage != pages.count - 1 else {
      indexPath = IndexPath(item: 0, section: 0)
      onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
      pageControl.currentPage = 0
      return
    }
    
    indexPath = IndexPath(item: pageControl.currentPage + 1, section: 0)
    onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    pageControl.currentPage += 1
  }

}

// MARK: - Collection View Data Source
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

// MARK: - Collection View Delegate Flow Layout
extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: view.frame.height)
  }
  
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
    onboardingCollectionView.scrollToItem(at: IndexPath(item: pageNumber, section: 0), at: .centeredHorizontally, animated: true)
    pageControl.currentPage = pageNumber
  }
  
  func collectionView(_ collectionView: UICollectionView, targetContentOffsetForProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
    return CGPoint(x: 0, y: 0)
  }
}
