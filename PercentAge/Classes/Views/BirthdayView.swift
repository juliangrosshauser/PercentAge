//
//  BirthdayView.swift
//  PercentAge
//
//  Created by Julian Grosshauser on 16/03/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import UIKit

class BirthdayView: UIView {

    //MARK: Properties

    let dayValueLabel = UILabel()
    let monthValueLabel = UILabel()
    let yearValueLabel = UILabel()

    private let dayTitleLabel = UILabel()
    private let monthTitleLabel = UILabel()
    private let yearTitleLabel = UILabel()

    let incrementDayButton = UIButton()
    let decrementDayButton = UIButton()
    let incrementMonthButton = UIButton()
    let decrementMonthButton = UIButton()
    let incrementYearButton = UIButton()
    let decrementYearButton = UIButton()

    let saveButton = UIButton()

    //MARK: Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        let labels = [self.dayValueLabel, self.monthValueLabel, self.yearValueLabel, self.dayTitleLabel, self.monthTitleLabel, self.yearTitleLabel]

        for label in labels {
            label.setTranslatesAutoresizingMaskIntoConstraints(false)
            label.textAlignment = .Center
            self.addSubview(label)
        }

        let valueLabels = [self.dayValueLabel, self.monthValueLabel, self.yearValueLabel]

        for valueLabel in valueLabels {
            valueLabel.font = UIFont(name: "Avenir Next", size: 32)
            valueLabel.textColor = UIColor(red:0.14, green:0.82, blue:0.99, alpha:1)
        }

        let titleLabels = [self.dayTitleLabel, self.monthTitleLabel, self.yearTitleLabel]

        for titleLabel in titleLabels {
            titleLabel.font = UIFont(name: "Avenir Next", size: 16)
            titleLabel.textColor = UIColor(red:0.8, green:0.8, blue:0.8, alpha:1)
        }

        self.dayTitleLabel.text = "Day"
        self.monthTitleLabel.text = "Month"
        self.yearTitleLabel.text = "Year"

        let buttons = [self.incrementDayButton, self.decrementDayButton, self.incrementMonthButton, self.decrementMonthButton, self.incrementYearButton, self.decrementYearButton]

        for button in buttons {
            button.setTranslatesAutoresizingMaskIntoConstraints(false)
            self.addSubview(button)
        }

        let incrementButtons = [self.incrementDayButton, self.incrementMonthButton, self.incrementYearButton]

        for incrementButton in incrementButtons {
            incrementButton.setImage(UIImage(named: "Plus Button"), forState: .Normal)
        }

        let decrementButtons = [self.decrementDayButton, self.decrementMonthButton, self.decrementYearButton]

        for decrementButton in decrementButtons {
            decrementButton.setImage(UIImage(named: "Minus Button"), forState: .Normal)
        }

        self.saveButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.saveButton.backgroundColor = UIColor(red:0.035, green:0.678, blue:0.066, alpha:1)
        self.saveButton.setTitle("Save", forState: .Normal)
        self.addSubview(self.saveButton)

        self.addConstraint(NSLayoutConstraint(item: self.dayValueLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 30))
        self.addConstraint(NSLayoutConstraint(item: self.monthValueLabel, attribute: .Height, relatedBy: .Equal, toItem: self.dayValueLabel, attribute: .Height, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.yearValueLabel, attribute: .Height, relatedBy: .Equal, toItem: self.dayValueLabel, attribute: .Height, multiplier: 1, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: self.incrementDayButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 50))
        self.addConstraint(NSLayoutConstraint(item: self.decrementDayButton, attribute: .Height, relatedBy: .Equal, toItem: self.incrementDayButton, attribute: .Height, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.incrementMonthButton, attribute: .Height, relatedBy: .Equal, toItem: self.incrementDayButton, attribute: .Height, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.decrementMonthButton, attribute: .Height, relatedBy: .Equal, toItem: self.incrementDayButton, attribute: .Height, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.incrementYearButton, attribute: .Height, relatedBy: .Equal, toItem: self.incrementDayButton, attribute: .Height, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.decrementYearButton, attribute: .Height, relatedBy: .Equal, toItem: self.incrementDayButton, attribute: .Height, multiplier: 1, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: self.saveButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 70))

        self.addConstraint(NSLayoutConstraint(item: self.dayValueLabel, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 40))
        self.addConstraint(NSLayoutConstraint(item: self.monthValueLabel, attribute: .Width, relatedBy: .Equal, toItem: self.dayValueLabel, attribute: .Width, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.yearValueLabel, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 80))

        self.addConstraint(NSLayoutConstraint(item: self.incrementDayButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 50))
        self.addConstraint(NSLayoutConstraint(item: self.decrementDayButton, attribute: .Width, relatedBy: .Equal, toItem: self.incrementDayButton, attribute: .Width, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.incrementMonthButton, attribute: .Width, relatedBy: .Equal, toItem: self.incrementDayButton, attribute: .Width, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.decrementMonthButton, attribute: .Width, relatedBy: .Equal, toItem: self.incrementDayButton, attribute: .Width, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.incrementYearButton, attribute: .Width, relatedBy: .Equal, toItem: self.incrementDayButton, attribute: .Width, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.decrementYearButton, attribute: .Width, relatedBy: .Equal, toItem: self.incrementDayButton, attribute: .Width, multiplier: 1, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: self.saveButton, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: 1, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: self.dayValueLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 0.8, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.monthValueLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.dayValueLabel, attribute: .CenterY, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.yearValueLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.dayValueLabel, attribute: .CenterY, multiplier: 1, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: self.dayTitleLabel, attribute: .Top, relatedBy: .Equal, toItem: self.dayValueLabel, attribute: .Bottom, multiplier: 1, constant: 10))
        self.addConstraint(NSLayoutConstraint(item: self.monthTitleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.dayTitleLabel, attribute: .CenterY, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.yearTitleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.dayTitleLabel, attribute: .CenterY, multiplier: 1, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: self.incrementDayButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.dayValueLabel, attribute: .Top, multiplier: 1, constant: -50))
        self.addConstraint(NSLayoutConstraint(item: self.decrementDayButton, attribute: .Top, relatedBy: .Equal, toItem: self.dayValueLabel, attribute: .Bottom, multiplier: 1, constant: 60))
        self.addConstraint(NSLayoutConstraint(item: self.incrementMonthButton, attribute: .CenterY, relatedBy: .Equal, toItem: self.incrementDayButton, attribute: .CenterY, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.decrementMonthButton, attribute: .CenterY, relatedBy: .Equal, toItem: self.decrementDayButton, attribute: .CenterY, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.incrementYearButton, attribute: .CenterY, relatedBy: .Equal, toItem: self.incrementDayButton, attribute: .CenterY, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.decrementYearButton, attribute: .CenterY, relatedBy: .Equal, toItem: self.decrementDayButton, attribute: .CenterY, multiplier: 1, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: self.saveButton, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: self.monthValueLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.dayValueLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.monthValueLabel, attribute: .CenterX, multiplier: 0.5, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.yearValueLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.monthValueLabel, attribute: .CenterX, multiplier: 1.5, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: self.dayTitleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.dayValueLabel, attribute: .CenterX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.monthTitleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.monthValueLabel, attribute: .CenterX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.yearTitleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.yearValueLabel, attribute: .CenterX, multiplier: 1, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: self.incrementDayButton, attribute: .CenterX, relatedBy: .Equal, toItem: self.dayValueLabel, attribute: .CenterX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.decrementDayButton, attribute: .CenterX, relatedBy: .Equal, toItem: self.dayValueLabel, attribute: .CenterX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.incrementMonthButton, attribute: .CenterX, relatedBy: .Equal, toItem: self.monthValueLabel, attribute: .CenterX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.decrementMonthButton, attribute: .CenterX, relatedBy: .Equal, toItem: self.monthValueLabel, attribute: .CenterX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.incrementYearButton, attribute: .CenterX, relatedBy: .Equal, toItem: self.yearValueLabel, attribute: .CenterX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.decrementYearButton, attribute: .CenterX, relatedBy: .Equal, toItem: self.yearValueLabel, attribute: .CenterX, multiplier: 1, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: self.saveButton, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0))
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
