//
//  PageCollectionViewCell.swift
//  AutoLayout_Tutorial
//
//  Created by Julio Hernandez-Duran on 10/1/17.
//  Copyright © 2017 MobileDevs. All rights reserved.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {

  var page: Page! {
    didSet {
      let attributedText = NSMutableAttributedString(string: page.title,
                                                     attributes: [.font : UIFont.boldSystemFont(ofSize: 18)])
      attributedText.append(NSAttributedString(string: page.message,
                                               attributes: [.font : UIFont.systemFont(ofSize: 14),
                                                            .foregroundColor: UIColor.gray]))
      
      let paragraphStyle = NSMutableParagraphStyle()
      paragraphStyle.alignment = .center
      paragraphStyle.lineSpacing = 4
      
      let length = attributedText.string.characters.count
      attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
      
      descriptionTextView.attributedText = attributedText
    }
  }
  
  let containerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let imageView: UIImageView = {
    let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let descriptionTextView: UITextView = {
    let textView = UITextView()
    textView.isSelectable = false
    textView.isEditable = false
    textView.isScrollEnabled = false
//    textView.backgroundColor = .brown
    textView.translatesAutoresizingMaskIntoConstraints = false
    return textView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .clear
//    backgroundColor = .red
    setupSubviews()
  }
  
  func setupSubviews() {
    addSubview(containerView)
    NSLayoutConstraint.activate([
      containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
      containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
      containerView.topAnchor.constraint(equalTo: topAnchor),
      containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
    ])

    containerView.addSubview(imageView)
    NSLayoutConstraint.activate([
      imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
      imageView.widthAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.6),
      imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
    ])

    addSubview(descriptionTextView)
    NSLayoutConstraint.activate([
      descriptionTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
      descriptionTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
      descriptionTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
      descriptionTextView.topAnchor.constraint(equalTo: containerView.bottomAnchor),
    ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
