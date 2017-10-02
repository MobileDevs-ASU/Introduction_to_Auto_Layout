//
//  PageCollectionViewCell.swift
//  AutoLayout_Tutorial
//
//  Created by Julio Hernandez-Duran on 10/1/17.
//  Copyright © 2017 MobileDevs. All rights reserved.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {

  var page: Page? {
    didSet {
      
    }
  }
  
  let containerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let bearImageView: UIImageView = {
    let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let descriptionTextView: UITextView = {
    let textView = UITextView()
    
    let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!",
                                                   attributes: [.font : UIFont.boldSystemFont(ofSize: 18)])
    attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads of fun? Don't wait any longer! We hope to see you in our stores soon.",
                                             attributes: [.font : UIFont.systemFont(ofSize: 13),
                                                          .foregroundColor: UIColor.gray]))
    textView.attributedText = attributedText
    textView.textAlignment = .center
    textView.isSelectable = false
    textView.isEditable = false
    textView.isScrollEnabled = false
    textView.translatesAutoresizingMaskIntoConstraints = false
    return textView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupSubviews()
  }
  
  func setupSubviews() {
    addSubview(containerView)
    
    containerView.addSubview(bearImageView)
    
    addSubview(descriptionTextView)
    
    containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    containerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true

    bearImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
    bearImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
    bearImageView.widthAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.6).isActive = true
    bearImageView.heightAnchor.constraint(equalTo: bearImageView.widthAnchor).isActive = true

    descriptionTextView.topAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    descriptionTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
    descriptionTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
    descriptionTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
