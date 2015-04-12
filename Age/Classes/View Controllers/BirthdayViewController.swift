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

    private var viewModel = BirthdayViewModel()

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

        birthdayView.incrementDayButton.addTarget(self.viewModel, action: "incrementDay", forControlEvents: .TouchUpInside)
        birthdayView.decrementDayButton.addTarget(self.viewModel, action: "decrementDay", forControlEvents: .TouchUpInside)
        birthdayView.incrementMonthButton.addTarget(self.viewModel, action: "incrementMonth", forControlEvents: .TouchUpInside)
        birthdayView.decrementMonthButton.addTarget(self.viewModel, action: "decrementMonth", forControlEvents: .TouchUpInside)
        birthdayView.incrementYearButton.addTarget(self.viewModel, action: "incrementYear", forControlEvents: .TouchUpInside)
        birthdayView.decrementYearButton.addTarget(self.viewModel, action: "decrementYear", forControlEvents: .TouchUpInside)
        birthdayView.saveButton.addTarget(self, action: "saveBirthday", forControlEvents: .TouchUpInside)
    }

    //MARK: Button Actions

    @objc
    private func saveBirthday() {
        self.viewModel.saveBirthdayIntoUserDefaults(NSUserDefaults.standardUserDefaults())
    }
}
