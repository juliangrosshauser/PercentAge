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

    private var day: Int {
        didSet {
            let birthdayView = self.view as! BirthdayView
            birthdayView.dayLabel.text = String(day)
        }
    }

    private var month: Int {
        didSet {
            let birthdayView = self.view as! BirthdayView
            birthdayView.monthLabel.text = String(month)
        }
    }

    private var year: Int {
        didSet {
            let birthdayView = self.view as! BirthdayView
            birthdayView.yearLabel.text = String(year)
        }
    }

    //MARK: Initialization

    init() {
        self.day = self.viewModel.day
        self.month = self.viewModel.month
        self.year = self.viewModel.year

        super.init(nibName: nil, bundle: nil)

        self.viewModel.addObserver(self, forKeyPath: "day", options: NSKeyValueObservingOptions.New, context: &BirthdayViewModel.observeContext)
        self.viewModel.addObserver(self, forKeyPath: "month", options: NSKeyValueObservingOptions.New, context: &BirthdayViewModel.observeContext)
        self.viewModel.addObserver(self, forKeyPath: "year", options: NSKeyValueObservingOptions.New, context: &BirthdayViewModel.observeContext)
    }

    required init(coder aDecoder: NSCoder) {
        self.day = self.viewModel.day
        self.month = self.viewModel.month
        self.year = self.viewModel.year

        super.init(coder: aDecoder)
    }

    //MARK: Deinitialization

    deinit {
        self.viewModel.removeObserver(self, forKeyPath: "day", context: &BirthdayViewModel.observeContext)
        self.viewModel.removeObserver(self, forKeyPath: "month", context: &BirthdayViewModel.observeContext)
        self.viewModel.removeObserver(self, forKeyPath: "year", context: &BirthdayViewModel.observeContext)
    }

    //MARK: Key-Value Observing

    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if (context == &BirthdayViewModel.observeContext) {
            if let newValue = change[NSKeyValueChangeNewKey] as? Int {
                switch keyPath {
                    case "day":
                        self.day = newValue

                    case "month":
                        self.month = newValue

                    case "year":
                        self.year = newValue

                    default:
                        super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
                }
            } else {
                super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
            }
        } else {
            super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
        }
    }

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
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}
