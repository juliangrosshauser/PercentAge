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
    private var longPressTimer: NSTimer?

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

        birthdayView.incrementDayButton.addTarget(self.viewModel, action: "incrementDay:", forControlEvents: .TouchUpInside)
        birthdayView.decrementDayButton.addTarget(self.viewModel, action: "decrementDay:", forControlEvents: .TouchUpInside)
        birthdayView.incrementMonthButton.addTarget(self.viewModel, action: "incrementMonth:", forControlEvents: .TouchUpInside)
        birthdayView.decrementMonthButton.addTarget(self.viewModel, action: "decrementMonth:", forControlEvents: .TouchUpInside)
        birthdayView.incrementYearButton.addTarget(self.viewModel, action: "incrementYear:", forControlEvents: .TouchUpInside)
        birthdayView.decrementYearButton.addTarget(self.viewModel, action: "decrementYear:", forControlEvents: .TouchUpInside)
        birthdayView.saveButton.addTarget(self, action: "saveBirthday:", forControlEvents: .TouchUpInside)

        let longPressIncrementDay = UILongPressGestureRecognizer(target: self, action: "longPressIncrementDay:")
        longPressIncrementDay.minimumPressDuration = 0.3
        birthdayView.incrementDayButton.addGestureRecognizer(longPressIncrementDay)

        let longPressIncrementMonth = UILongPressGestureRecognizer(target: self, action: "longPressIncrementMonth:")
        longPressIncrementMonth.minimumPressDuration = 0.3
        birthdayView.incrementMonthButton.addGestureRecognizer(longPressIncrementMonth)

        let longPressIncrementYear = UILongPressGestureRecognizer(target: self, action: "longPressIncrementYear:")
        longPressIncrementYear.minimumPressDuration = 0.3
        birthdayView.incrementYearButton.addGestureRecognizer(longPressIncrementYear)

        let longPressDecrementDay = UILongPressGestureRecognizer(target: self, action: "longPressDecrementDay:")
        longPressDecrementDay.minimumPressDuration = 0.3
        birthdayView.decrementDayButton.addGestureRecognizer(longPressDecrementDay)

        let longPressDecrementMonth = UILongPressGestureRecognizer(target: self, action: "longPressDecrementMonth:")
        longPressDecrementMonth.minimumPressDuration = 0.3
        birthdayView.decrementMonthButton.addGestureRecognizer(longPressDecrementMonth)

        let longPressDecrementYear = UILongPressGestureRecognizer(target: self, action: "longPressDecrementYear:")
        longPressDecrementYear.minimumPressDuration = 0.3
        birthdayView.decrementYearButton.addGestureRecognizer(longPressDecrementYear)
    }

    //MARK: Button Actions

    @objc
    private func saveBirthday(sender: AnyObject) {
        self.viewModel.saveBirthdayIntoUserDefaults(NSUserDefaults.standardUserDefaults())
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

    //MARK: Gesture Recognizer Actions

    @objc
    private func longPressIncrementDay(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        if (longPressGestureRecognizer.state == .Began) {
            self.longPressTimer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self.viewModel, selector: "incrementDay:", userInfo: nil, repeats: true)
        }

        if (longPressGestureRecognizer.state == .Ended) {
            self.longPressTimer?.invalidate()
        }
    }

    @objc
    private func longPressIncrementMonth(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        if (longPressGestureRecognizer.state == .Began) {
            self.longPressTimer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self.viewModel, selector: "incrementMonth:", userInfo: nil, repeats: true)
        }

        if (longPressGestureRecognizer.state == .Ended) {
            self.longPressTimer?.invalidate()
        }
    }

    @objc
    private func longPressIncrementYear(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        if (longPressGestureRecognizer.state == .Began) {
            self.longPressTimer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self.viewModel, selector: "incrementYear:", userInfo: nil, repeats: true)
        }

        if (longPressGestureRecognizer.state == .Ended) {
            self.longPressTimer?.invalidate()
        }
    }

    @objc
    private func longPressDecrementDay(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        if (longPressGestureRecognizer.state == .Began) {
            self.longPressTimer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self.viewModel, selector: "decrementDay:", userInfo: nil, repeats: true)
        }

        if (longPressGestureRecognizer.state == .Ended) {
            self.longPressTimer?.invalidate()
        }
    }

    @objc
    private func longPressDecrementMonth(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        if (longPressGestureRecognizer.state == .Began) {
            self.longPressTimer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self.viewModel, selector: "decrementMonth:", userInfo: nil, repeats: true)
        }

        if (longPressGestureRecognizer.state == .Ended) {
            self.longPressTimer?.invalidate()
        }
    }

    @objc
    private func longPressDecrementYear(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        if (longPressGestureRecognizer.state == .Began) {
            self.longPressTimer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self.viewModel, selector: "decrementYear:", userInfo: nil, repeats: true)
        }

        if (longPressGestureRecognizer.state == .Ended) {
            self.longPressTimer?.invalidate()
        }
    }
}
