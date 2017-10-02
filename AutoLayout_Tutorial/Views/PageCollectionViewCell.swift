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
    textView.translatesAutoresizingMaskIntoConstraints = false
    return textView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(containerView)
    
    containerView.addSubview(imageView)
    
    addSubview(descriptionTextView)
    
    setupConstraints()
  }
  
  func setupConstraints() {
    containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    containerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true

    imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
    imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
    imageView.widthAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.6).isActive = true
    imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true

    descriptionTextView.topAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    descriptionTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
    descriptionTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
    descriptionTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
