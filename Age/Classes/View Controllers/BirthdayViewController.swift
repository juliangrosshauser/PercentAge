//
//  BirthdayViewController.swift
//  Age
//
//  Created by Julian Grosshauser on 14/03/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import UIKit

class BirthdayViewController: UIViewController {

    private let dayLabel = UILabel()
    private let monthLabel = UILabel()
    private let yearLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dayLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.dayLabel.text = "06"
        self.dayLabel.textAlignment = NSTextAlignment.Center
        self.dayLabel.layer.borderWidth = 1
        self.dayLabel.layer.borderColor = UIColor.grayColor().CGColor
        self.dayLabel.layer.cornerRadius = 5
        self.view.addSubview(self.dayLabel)

        self.monthLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.monthLabel.text = "03"
        self.monthLabel.textAlignment = NSTextAlignment.Center
        self.monthLabel.layer.borderWidth = 1
        self.monthLabel.layer.borderColor = UIColor.grayColor().CGColor
        self.monthLabel.layer.cornerRadius = 5
        self.view.addSubview(self.monthLabel)

        self.yearLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.yearLabel.text = "1991"
        self.yearLabel.textAlignment = NSTextAlignment.Center
        self.yearLabel.layer.borderWidth = 1
        self.yearLabel.layer.borderColor = UIColor.grayColor().CGColor
        self.yearLabel.layer.cornerRadius = 5
        self.view.addSubview(self.yearLabel)

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

        self.view.addConstraint(NSLayoutConstraint(item: saveButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.dayLabel, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))

        self.view.addConstraint(NSLayoutConstraint(item: self.dayLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 35))
        self.view.addConstraint(NSLayoutConstraint(item: self.monthLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.dayLabel, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.yearLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 60))

        self.view.addConstraint(NSLayoutConstraint(item: saveButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100))

        self.view.addConstraint(NSLayoutConstraint(item: self.dayLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 0.5, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.monthLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.dayLabel, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.yearLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.dayLabel, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))

        self.view.addConstraint(NSLayoutConstraint(item: saveButton, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1.5, constant: 0))

        self.view.addConstraint(NSLayoutConstraint(item: self.monthLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.dayLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.monthLabel, attribute: NSLayoutAttribute.CenterX, multiplier: 0.5, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.yearLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.monthLabel, attribute: NSLayoutAttribute.CenterX, multiplier: 1.5, constant: 0))

        self.view.addConstraint(NSLayoutConstraint(item: saveButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
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
