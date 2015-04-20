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

    let dayLabel = UILabel()
    let monthLabel = UILabel()
    let yearLabel = UILabel()

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

        let labels = [self.dayLabel, self.monthLabel, self.yearLabel]

        for label in labels {
            label.setTranslatesAutoresizingMaskIntoConstraints(false)
            label.textAlignment = NSTextAlignment.Center
            label.font = UIFont(name: "Avenir Next", size: 32)
            label.textColor = UIColor(red:0.14, green:0.82, blue:0.99, alpha:1)
            self.addSubview(label)
        }

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
        self.saveButton.setTitle("Save", forState: UIControlState.Normal)
        self.addSubview(self.saveButton)

        self.addConstraint(NSLayoutConstraint(item: self.dayLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 30))
        self.addConstraint(NSLayoutConstraint(item: self.monthLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.dayLabel, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.yearLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.dayLabel, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: self.incrementDayButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 50))
        self.addConstraint(NSLayoutConstraint(item: self.decrementDayButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.incrementDayButton, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.incrementMonthButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.incrementDayButton, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.decrementMonthButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.incrementDayButton, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.incrementYearButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.incrementDayButton, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.decrementYearButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.incrementDayButton, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: self.saveButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 70))

        self.addConstraint(NSLayoutConstraint(item: self.dayLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 40))
        self.addConstraint(NSLayoutConstraint(item: self.monthLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.dayLabel, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.yearLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 80))

        self.addConstraint(NSLayoutConstraint(item: self.incrementDayButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 50))
        self.addConstraint(NSLayoutConstraint(item: self.decrementDayButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.incrementDayButton, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.incrementMonthButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.incrementDayButton, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.decrementMonthButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.incrementDayButton, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.incrementYearButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.incrementDayButton, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.decrementYearButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.incrementDayButton, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: self.saveButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: self.dayLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 0.8, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.monthLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.dayLabel, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.yearLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.dayLabel, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: self.incrementDayButton, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.dayLabel, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: -50))
        self.addConstraint(NSLayoutConstraint(item: self.decrementDayButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.dayLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 50))
        self.addConstraint(NSLayoutConstraint(item: self.incrementMonthButton, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.incrementDayButton, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.decrementMonthButton, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.decrementDayButton, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.incrementYearButton, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.incrementDayButton, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.decrementYearButton, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.decrementDayButton, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: self.saveButton, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1.5, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: self.monthLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.dayLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.monthLabel, attribute: NSLayoutAttribute.CenterX, multiplier: 0.5, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.yearLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.monthLabel, attribute: NSLayoutAttribute.CenterX, multiplier: 1.5, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: self.incrementDayButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.dayLabel, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.decrementDayButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.dayLabel, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.incrementMonthButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.monthLabel, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.decrementMonthButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.monthLabel, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.incrementYearButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.yearLabel, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.decrementYearButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.yearLabel, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: self.saveButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
