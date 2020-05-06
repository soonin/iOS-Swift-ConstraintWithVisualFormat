//
//  ViewController.swift
//  iOS-Swift-ConstraintWithVisualFormat
//
//  Created by Pooya on 2020-05-05.
//  Copyright © 2020 centurytrail.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sampleView : UIView!
    
    let dateTimeLabel:UILabel = {
        let label = PaddingLabel()
        label.text = " Today 2:30 pm "
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)  //UIFont.systemFont(ofSize: 13)
        label.layer.backgroundColor = UIColor.gray.cgColor
        label.textColor = UIColor.white
        label.layer.cornerRadius = 5
        return label
    }()
    
    let subTitleLabel:UILabel = {
        let label = UILabel()
        label.text = " Time for Pickup "
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption1)  //UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.blue
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sampleView.addSubview(dateTimeLabel)
        sampleView.addSubview(subTitleLabel)
        //        sampleView.addConstraintsWithFormatVC("H:|-10-[v0]-10-[v1]", views: dateTimeLabel,subTitleLabel)
        sampleView.addConstraintsWithFormatVC("H:|-10-[v0]", views: dateTimeLabel)
        sampleView.addConstraintsWithFormatVC("H:[v0(100)]-10-|", views: subTitleLabel)
        sampleView.addConstraintsWithFormatVC("V:|-10-[v0]-220-|", views: dateTimeLabel)
        sampleView.addConstraintsWithFormatVC("V:[v0(30)]-10-|", views: subTitleLabel)
        
    }

}




extension UIView {
    func addConstraintsWithFormatVC(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: nil, views: viewsDictionary))
    }
}



@IBDesignable class PaddingLabel: UILabel {
    
    @IBInspectable var topInset: CGFloat = 5.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leftInset: CGFloat = 16.0
    @IBInspectable var rightInset: CGFloat = 16.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
}
