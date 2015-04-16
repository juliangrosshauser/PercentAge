//
//  BirthdayViewController.swift
//  PercentAge
//
//  Created by Julian Grosshauser on 14/03/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import UIKit

class BirthdayViewController: UIViewController {

    //MARK: Properties

    private var viewModel = BirthdayViewModel()

    //MARK: Initialization

    init() {
        super.init(nibName: nil, bundle: nil)

        self.viewModel.addObserver(self, forKeyPath: "day", options: NSKeyValueObservingOptions.New, context: &BirthdayViewModel.observeContext)
        self.viewModel.addObserver(self, forKeyPath: "month", options: NSKeyValueObservingOptions.New, context: &BirthdayViewModel.observeContext)
        self.viewModel.addObserver(self, forKeyPath: "year", options: NSKeyValueObservingOptions.New, context: &BirthdayViewModel.observeContext)
    }

    required init(coder aDecoder: NSCoder) {
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
                let birthdayView = self.view as! BirthdayView

                switch keyPath {
                    case "day":
                        birthdayView.dayLabel.text = String(newValue)

                    case "month":
                        birthdayView.monthLabel.text = String(newValue)

                    case "year":
                        birthdayView.yearLabel.text = String(newValue)

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

        birthdayView.dayLabel.text = String(self.viewModel.day)
        birthdayView.monthLabel.text = String(self.viewModel.month)
        birthdayView.yearLabel.text = String(self.viewModel.year)

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
