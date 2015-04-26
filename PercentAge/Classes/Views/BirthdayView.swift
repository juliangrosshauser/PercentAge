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

        let labels = [dayValueLabel, monthValueLabel, yearValueLabel, dayTitleLabel, monthTitleLabel, yearTitleLabel]

        for label in labels {
            label.setTranslatesAutoresizingMaskIntoConstraints(false)
            label.textAlignment = .Center
            addSubview(label)
        }

        let valueLabels = [dayValueLabel, monthValueLabel, yearValueLabel]

        for valueLabel in valueLabels {
            valueLabel.font = UIFont(name: "Avenir Next", size: 32)
            valueLabel.textColor = UIColor(red:0.14, green:0.82, blue:0.99, alpha:1)
        }

        let titleLabels = [dayTitleLabel, monthTitleLabel, yearTitleLabel]

        for titleLabel in titleLabels {
            titleLabel.font = UIFont(name: "Avenir Next", size: 16)
            titleLabel.textColor = UIColor(red:0.8, green:0.8, blue:0.8, alpha:1)
        }

        dayTitleLabel.text = "Day"
        monthTitleLabel.text = "Month"
        yearTitleLabel.text = "Year"

        let buttons = [incrementDayButton, decrementDayButton, incrementMonthButton, decrementMonthButton, incrementYearButton, decrementYearButton]

        for button in buttons {
            button.setTranslatesAutoresizingMaskIntoConstraints(false)
            addSubview(button)
        }

        let incrementButtons = [incrementDayButton, incrementMonthButton, incrementYearButton]

        for incrementButton in incrementButtons {
            incrementButton.setImage(UIImage(named: "Plus Button"), forState: .Normal)
            incrementButton.setImage(UIImage(named: "Plus Button"), forState: .Highlighted)
        }

        let decrementButtons = [decrementDayButton, decrementMonthButton, decrementYearButton]

        for decrementButton in decrementButtons {
            decrementButton.setImage(UIImage(named: "Minus Button"), forState: .Normal)
            decrementButton.setImage(UIImage(named: "Minus Button"), forState: .Highlighted)
        }

        saveButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        saveButton.backgroundColor = UIColor(red:0.035, green:0.678, blue:0.066, alpha:1)
        saveButton.setTitle("Save", forState: .Normal)
        addSubview(saveButton)

        addConstraint(NSLayoutConstraint(item: dayValueLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 30))
        addConstraint(NSLayoutConstraint(item: monthValueLabel, attribute: .Height, relatedBy: .Equal, toItem: dayValueLabel, attribute: .Height, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: yearValueLabel, attribute: .Height, relatedBy: .Equal, toItem: dayValueLabel, attribute: .Height, multiplier: 1, constant: 0))

        addConstraint(NSLayoutConstraint(item: incrementDayButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 50))
        addConstraint(NSLayoutConstraint(item: decrementDayButton, attribute: .Height, relatedBy: .Equal, toItem: incrementDayButton, attribute: .Height, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: incrementMonthButton, attribute: .Height, relatedBy: .Equal, toItem: incrementDayButton, attribute: .Height, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: decrementMonthButton, attribute: .Height, relatedBy: .Equal, toItem: incrementDayButton, attribute: .Height, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: incrementYearButton, attribute: .Height, relatedBy: .Equal, toItem: incrementDayButton, attribute: .Height, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: decrementYearButton, attribute: .Height, relatedBy: .Equal, toItem: incrementDayButton, attribute: .Height, multiplier: 1, constant: 0))

        addConstraint(NSLayoutConstraint(item: saveButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 70))

        addConstraint(NSLayoutConstraint(item: dayValueLabel, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 40))
        addConstraint(NSLayoutConstraint(item: monthValueLabel, attribute: .Width, relatedBy: .Equal, toItem: dayValueLabel, attribute: .Width, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: yearValueLabel, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 80))

        addConstraint(NSLayoutConstraint(item: incrementDayButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 50))
        addConstraint(NSLayoutConstraint(item: decrementDayButton, attribute: .Width, relatedBy: .Equal, toItem: incrementDayButton, attribute: .Width, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: incrementMonthButton, attribute: .Width, relatedBy: .Equal, toItem: incrementDayButton, attribute: .Width, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: decrementMonthButton, attribute: .Width, relatedBy: .Equal, toItem: incrementDayButton, attribute: .Width, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: incrementYearButton, attribute: .Width, relatedBy: .Equal, toItem: incrementDayButton, attribute: .Width, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: decrementYearButton, attribute: .Width, relatedBy: .Equal, toItem: incrementDayButton, attribute: .Width, multiplier: 1, constant: 0))

        addConstraint(NSLayoutConstraint(item: saveButton, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: 1, constant: 0))

        addConstraint(NSLayoutConstraint(item: dayValueLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 0.8, constant: 0))
        addConstraint(NSLayoutConstraint(item: monthValueLabel, attribute: .CenterY, relatedBy: .Equal, toItem: dayValueLabel, attribute: .CenterY, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: yearValueLabel, attribute: .CenterY, relatedBy: .Equal, toItem: dayValueLabel, attribute: .CenterY, multiplier: 1, constant: 0))

        addConstraint(NSLayoutConstraint(item: dayTitleLabel, attribute: .Top, relatedBy: .Equal, toItem: dayValueLabel, attribute: .Bottom, multiplier: 1, constant: 10))
        addConstraint(NSLayoutConstraint(item: monthTitleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: dayTitleLabel, attribute: .CenterY, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: yearTitleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: dayTitleLabel, attribute: .CenterY, multiplier: 1, constant: 0))

        addConstraint(NSLayoutConstraint(item: incrementDayButton, attribute: .Bottom, relatedBy: .Equal, toItem: dayValueLabel, attribute: .Top, multiplier: 1, constant: -50))
        addConstraint(NSLayoutConstraint(item: decrementDayButton, attribute: .Top, relatedBy: .Equal, toItem: dayValueLabel, attribute: .Bottom, multiplier: 1, constant: 60))
        addConstraint(NSLayoutConstraint(item: incrementMonthButton, attribute: .CenterY, relatedBy: .Equal, toItem: incrementDayButton, attribute: .CenterY, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: decrementMonthButton, attribute: .CenterY, relatedBy: .Equal, toItem: decrementDayButton, attribute: .CenterY, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: incrementYearButton, attribute: .CenterY, relatedBy: .Equal, toItem: incrementDayButton, attribute: .CenterY, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: decrementYearButton, attribute: .CenterY, relatedBy: .Equal, toItem: decrementDayButton, attribute: .CenterY, multiplier: 1, constant: 0))

        addConstraint(NSLayoutConstraint(item: saveButton, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1, constant: 0))

        addConstraint(NSLayoutConstraint(item: monthValueLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: dayValueLabel, attribute: .CenterX, relatedBy: .Equal, toItem: monthValueLabel, attribute: .CenterX, multiplier: 0.5, constant: 0))
        addConstraint(NSLayoutConstraint(item: yearValueLabel, attribute: .CenterX, relatedBy: .Equal, toItem: monthValueLabel, attribute: .CenterX, multiplier: 1.5, constant: 0))

        addConstraint(NSLayoutConstraint(item: dayTitleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: dayValueLabel, attribute: .CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: monthTitleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: monthValueLabel, attribute: .CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: yearTitleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: yearValueLabel, attribute: .CenterX, multiplier: 1, constant: 0))

        addConstraint(NSLayoutConstraint(item: incrementDayButton, attribute: .CenterX, relatedBy: .Equal, toItem: dayValueLabel, attribute: .CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: decrementDayButton, attribute: .CenterX, relatedBy: .Equal, toItem: dayValueLabel, attribute: .CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: incrementMonthButton, attribute: .CenterX, relatedBy: .Equal, toItem: monthValueLabel, attribute: .CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: decrementMonthButton, attribute: .CenterX, relatedBy: .Equal, toItem: monthValueLabel, attribute: .CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: incrementYearButton, attribute: .CenterX, relatedBy: .Equal, toItem: yearValueLabel, attribute: .CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: decrementYearButton, attribute: .CenterX, relatedBy: .Equal, toItem: yearValueLabel, attribute: .CenterX, multiplier: 1, constant: 0))

        addConstraint(NSLayoutConstraint(item: saveButton, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0))
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
