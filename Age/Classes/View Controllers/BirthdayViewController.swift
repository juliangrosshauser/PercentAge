//
//  BirthdayViewController.swift
//  Age
//
//  Created by Julian Grosshauser on 14/03/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import UIKit

class BirthdayViewController: UIViewController {

    private var day: Int = 1
    private var month: Int = 1
    private var year: Int = 2015

    private let dayLabel = UILabel()
    private let monthLabel = UILabel()
    private let yearLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dayLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.dayLabel.text = String(self.day)
        self.dayLabel.textAlignment = NSTextAlignment.Center
        self.dayLabel.layer.borderWidth = 1
        self.dayLabel.layer.borderColor = UIColor.grayColor().CGColor
        self.dayLabel.layer.cornerRadius = 5
        self.view.addSubview(self.dayLabel)

        let incrementDayButton = UIButton()
        incrementDayButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        incrementDayButton.setTitle("+", forState: UIControlState.Normal)
        incrementDayButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        incrementDayButton.layer.borderColor = UIColor.grayColor().CGColor
        incrementDayButton.layer.borderWidth = 1
        incrementDayButton.layer.cornerRadius = 10
        incrementDayButton.addTarget(self, action: "incrementDay", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(incrementDayButton)

        let decrementDayButton = UIButton()
        decrementDayButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        decrementDayButton.setTitle("-", forState: UIControlState.Normal)
        decrementDayButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        decrementDayButton.layer.borderColor = UIColor.grayColor().CGColor
        decrementDayButton.layer.borderWidth = 1
        decrementDayButton.layer.cornerRadius = 10
        decrementDayButton.addTarget(self, action: "decrementDay", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(decrementDayButton)

        self.monthLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.monthLabel.text = String(self.month)
        self.monthLabel.textAlignment = NSTextAlignment.Center
        self.monthLabel.layer.borderWidth = 1
        self.monthLabel.layer.borderColor = UIColor.grayColor().CGColor
        self.monthLabel.layer.cornerRadius = 5
        self.view.addSubview(self.monthLabel)

        let incrementMonthButton = UIButton()
        incrementMonthButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        incrementMonthButton.setTitle("+", forState: UIControlState.Normal)
        incrementMonthButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        incrementMonthButton.layer.borderColor = UIColor.grayColor().CGColor
        incrementMonthButton.layer.borderWidth = 1
        incrementMonthButton.layer.cornerRadius = 10
        incrementMonthButton.addTarget(self, action: "incrementMonth", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(incrementMonthButton)

        let decrementMonthButton = UIButton()
        decrementMonthButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        decrementMonthButton.setTitle("-", forState: UIControlState.Normal)
        decrementMonthButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        decrementMonthButton.layer.borderColor = UIColor.grayColor().CGColor
        decrementMonthButton.layer.borderWidth = 1
        decrementMonthButton.layer.cornerRadius = 10
        decrementMonthButton.addTarget(self, action: "decrementMonth", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(decrementMonthButton)

        self.yearLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.yearLabel.text = String(self.year)
        self.yearLabel.textAlignment = NSTextAlignment.Center
        self.yearLabel.layer.borderWidth = 1
        self.yearLabel.layer.borderColor = UIColor.grayColor().CGColor
        self.yearLabel.layer.cornerRadius = 5
        self.view.addSubview(self.yearLabel)

        let incrementYearButton = UIButton()
        incrementYearButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        incrementYearButton.setTitle("+", forState: UIControlState.Normal)
        incrementYearButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        incrementYearButton.layer.borderColor = UIColor.grayColor().CGColor
        incrementYearButton.layer.borderWidth = 1
        incrementYearButton.layer.cornerRadius = 10
        incrementYearButton.addTarget(self, action: "incrementYear", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(incrementYearButton)

        let decrementYearButton = UIButton()
        decrementYearButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        decrementYearButton.setTitle("-", forState: UIControlState.Normal)
        decrementYearButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        decrementYearButton.layer.borderColor = UIColor.grayColor().CGColor
        decrementYearButton.layer.borderWidth = 1
        decrementYearButton.layer.cornerRadius = 10
        decrementYearButton.addTarget(self, action: "decrementYear", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(decrementYearButton)

        let saveButton = UIButton()
        saveButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        saveButton.backgroundColor = UIColor(red:0.035, green:0.678, blue:0.066, alpha:1)
        saveButton.layer.cornerRadius = 5
        saveButton.setTitle("Save", forState: UIControlState.Normal)
        saveButton.addTarget(self, action: "saveBirthday", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(saveButton)

        self.view.addConstraint(NSLayoutConstraint(item: self.dayLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 30))
        self.view.addConstraint(NSLayoutConstraint(item: self.monthLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.dayLabel, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.yearLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.dayLabel, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))

        self.view.addConstraint(NSLayoutConstraint(item: incrementDayButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 20))
        self.view.addConstraint(NSLayoutConstraint(item: decrementDayButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: incrementDayButton, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: incrementMonthButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: incrementDayButton, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: decrementMonthButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: incrementDayButton, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: incrementYearButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: incrementDayButton, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: decrementYearButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: incrementDayButton, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))

        self.view.addConstraint(NSLayoutConstraint(item: saveButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.dayLabel, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))

        self.view.addConstraint(NSLayoutConstraint(item: self.dayLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 35))
        self.view.addConstraint(NSLayoutConstraint(item: self.monthLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.dayLabel, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.yearLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 60))

        self.view.addConstraint(NSLayoutConstraint(item: incrementDayButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 20))
        self.view.addConstraint(NSLayoutConstraint(item: decrementDayButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: incrementDayButton, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: incrementMonthButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: incrementDayButton, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: decrementMonthButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: incrementDayButton, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: incrementYearButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: incrementDayButton, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: decrementYearButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: incrementDayButton, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))

        self.view.addConstraint(NSLayoutConstraint(item: saveButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100))

        self.view.addConstraint(NSLayoutConstraint(item: self.dayLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 0.5, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.monthLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.dayLabel, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.yearLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.dayLabel, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))

        self.view.addConstraint(NSLayoutConstraint(item: incrementDayButton, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.dayLabel, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: -20))
        self.view.addConstraint(NSLayoutConstraint(item: decrementDayButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.dayLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 20))
        self.view.addConstraint(NSLayoutConstraint(item: incrementMonthButton, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: incrementDayButton, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: decrementMonthButton, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: decrementDayButton, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: incrementYearButton, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: incrementDayButton, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: decrementYearButton, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: decrementDayButton, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))

        self.view.addConstraint(NSLayoutConstraint(item: saveButton, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1.5, constant: 0))

        self.view.addConstraint(NSLayoutConstraint(item: self.monthLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.dayLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.monthLabel, attribute: NSLayoutAttribute.CenterX, multiplier: 0.5, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.yearLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.monthLabel, attribute: NSLayoutAttribute.CenterX, multiplier: 1.5, constant: 0))

        self.view.addConstraint(NSLayoutConstraint(item: incrementDayButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.dayLabel, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: decrementDayButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.dayLabel, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: incrementMonthButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.monthLabel, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: decrementMonthButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.monthLabel, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: incrementYearButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.yearLabel, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: decrementYearButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.yearLabel, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))

        self.view.addConstraint(NSLayoutConstraint(item: saveButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
    }

    @objc
    private func incrementDay() {
        if (self.day == 31) {
            self.day = 1
        } else {
            self.day++
        }

        self.dayLabel.text = String(self.day)
    }

    @objc
    private func decrementDay() {
        if (self.day == 1) {
            self.day = 31
        } else {
            self.day--
        }

        self.dayLabel.text = String(self.day)
    }

    @objc
    private func incrementMonth() {
        if (self.month == 12) {
            self.month = 1
        } else {
            self.month++
        }

        self.monthLabel.text = String(self.month)
    }

    @objc
    private func decrementMonth() {
        if (self.month == 1) {
            self.month = 12
        } else {
            self.month--
        }

        self.monthLabel.text = String(self.month)
    }

    @objc
    private func incrementYear() {
        if (self.year == 2015) {
            self.year = 1900
        } else {
            self.year++
        }

        self.yearLabel.text = String(self.year)
    }

    @objc
    private func decrementYear() {
        if (self.year == 1900) {
            self.year = 2015
        } else {
            self.year--
        }

        self.yearLabel.text = String(self.year)
    }

    @objc
    private func saveBirthday() {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-mm-yyyy"
        let birthday = dateFormatter.dateFromString("\(self.dayLabel.text!)-\(self.monthLabel.text!)-\(self.yearLabel.text!)")

        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(birthday, forKey: "birthday")

        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}
