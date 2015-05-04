//
//  TodayView.swift
//  PercentAgeToday
//
//  Created by Julian Grosshauser on 02/05/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import UIKit

class TodayView: UIView {

    //MARK: Properties

    let ageLabel: UILabel = {
        let label = UILabel()

        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.font = UIFont(name: "Avenir Next", size: 16)
        label.textColor = .whiteColor()

        return label
    }()

    //MARK: Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(ageLabel)

        addConstraint(NSLayoutConstraint(item: ageLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: ageLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0))
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
