//
//  BirthdayViewController.swift
//  Age
//
//  Created by Julian Grosshauser on 14/03/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import UIKit

class BirthdayViewController: UIViewController {

    //MARK: Properties

    private var day: Int = 1
    private var month: Int = 1
    private var year: Int = 2015

    //MARK: UIViewController

    override func loadView() {
        self.view = BirthdayView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let birthdayView = self.view as! BirthdayView

        birthdayView.dayLabel.text = String(self.day)
        birthdayView.monthLabel.text = String(self.month)
        birthdayView.yearLabel.text = String(self.year)

        birthdayView.incrementDayButton.addTarget(self, action: "incrementDay", forControlEvents: UIControlEvents.TouchUpInside)
        birthdayView.decrementDayButton.addTarget(self, action: "decrementDay", forControlEvents: UIControlEvents.TouchUpInside)
        birthdayView.incrementMonthButton.addTarget(self, action: "incrementMonth", forControlEvents: UIControlEvents.TouchUpInside)
        birthdayView.decrementMonthButton.addTarget(self, action: "decrementMonth", forControlEvents: UIControlEvents.TouchUpInside)
        birthdayView.incrementYearButton.addTarget(self, action: "incrementYear", forControlEvents: UIControlEvents.TouchUpInside)
        birthdayView.decrementYearButton.addTarget(self, action: "decrementYear", forControlEvents: UIControlEvents.TouchUpInside)

        birthdayView.saveButton.addTarget(self, action: "saveBirthday", forControlEvents: UIControlEvents.TouchUpInside)
    }

    //MARK: Button Actions

    @objc
    private func incrementDay() {
        if (self.day == 31) {
            self.day = 1
        } else {
            self.day++
        }

        let birthdayView = self.view as! BirthdayView
        birthdayView.dayLabel.text = String(self.day)
    }

    @objc
    private func decrementDay() {
        if (self.day == 1) {
            self.day = 31
        } else {
            self.day--
        }

        let birthdayView = self.view as! BirthdayView
        birthdayView.dayLabel.text = String(self.day)
    }

    @objc
    private func incrementMonth() {
        if (self.month == 12) {
            self.month = 1
        } else {
            self.month++
        }

        let birthdayView = self.view as! BirthdayView
        birthdayView.monthLabel.text = String(self.month)
    }

    @objc
    private func decrementMonth() {
        if (self.month == 1) {
            self.month = 12
        } else {
            self.month--
        }

        let birthdayView = self.view as! BirthdayView
        birthdayView.monthLabel.text = String(self.month)
    }

    @objc
    private func incrementYear() {
        if (self.year == 2015) {
            self.year = 1900
        } else {
            self.year++
        }

        let birthdayView = self.view as! BirthdayView
        birthdayView.yearLabel.text = String(self.year)
    }

    @objc
    private func decrementYear() {
        if (self.year == 1900) {
            self.year = 2015
        } else {
            self.year--
        }

        let birthdayView = self.view as! BirthdayView
        birthdayView.yearLabel.text = String(self.year)
    }

    @objc
    private func saveBirthday() {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-mm-yyyy"
        let birthdayView = self.view as! BirthdayView
        let birthday = dateFormatter.dateFromString("\(birthdayView.dayLabel.text!)-\(birthdayView.monthLabel.text!)-\(birthdayView.yearLabel.text!)")

        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(birthday, forKey: "birthday")

        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}
