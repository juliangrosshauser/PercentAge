//
//  BirthdayViewController.swift
//  PercentAge
//
//  Created by Julian Grosshauser on 14/03/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import UIKit
import PercentAgeKit

class BirthdayViewController: UIViewController {

    //MARK: Properties

    private let viewModel = BirthdayViewModel()
    private var longPressTimer: NSTimer?

    //MARK: Initialization

    init() {
        super.init(nibName: nil, bundle: nil)

        viewModel.addObserver(self, forKeyPath: "day", options: .New, context: &BirthdayViewModel.observeContext)
        viewModel.addObserver(self, forKeyPath: "month", options: .New, context: &BirthdayViewModel.observeContext)
        viewModel.addObserver(self, forKeyPath: "year", options: .New, context: &BirthdayViewModel.observeContext)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    //MARK: Deinitialization

    deinit {
        viewModel.removeObserver(self, forKeyPath: "day", context: &BirthdayViewModel.observeContext)
        viewModel.removeObserver(self, forKeyPath: "month", context: &BirthdayViewModel.observeContext)
        viewModel.removeObserver(self, forKeyPath: "year", context: &BirthdayViewModel.observeContext)
    }

    //MARK: Key-Value Observing

    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if (context == &BirthdayViewModel.observeContext) {
            if let newValue = change[NSKeyValueChangeNewKey] as? Int {
                let birthdayView = view as! BirthdayView

                switch keyPath {
                    case "day":
                        birthdayView.dayValueLabel.text = String(newValue)

                    case "month":
                        birthdayView.monthValueLabel.text = String(newValue)

                    case "year":
                        birthdayView.yearValueLabel.text = String(newValue)

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
        view = BirthdayView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let birthdayView = view as! BirthdayView

        birthdayView.dayValueLabel.text = String(viewModel.day)
        birthdayView.monthValueLabel.text = String(viewModel.month)
        birthdayView.yearValueLabel.text = String(viewModel.year)

        birthdayView.incrementDayButton.addTarget(self, action: "incrementDayButtonDown:", forControlEvents: .TouchDown)
        birthdayView.incrementDayButton.addTarget(self, action: "resetButtonTransform:", forControlEvents: .TouchUpInside)

        birthdayView.decrementDayButton.addTarget(self, action: "decrementDayButtonDown:", forControlEvents: .TouchDown)
        birthdayView.decrementDayButton.addTarget(self, action: "resetButtonTransform:", forControlEvents: .TouchUpInside)

        birthdayView.incrementMonthButton.addTarget(self, action: "incrementMonthButtonDown:", forControlEvents: .TouchDown)
        birthdayView.incrementMonthButton.addTarget(self, action: "resetButtonTransform:", forControlEvents: .TouchUpInside)

        birthdayView.decrementMonthButton.addTarget(self, action: "decrementMonthButtonDown:", forControlEvents: .TouchDown)
        birthdayView.decrementMonthButton.addTarget(self, action: "resetButtonTransform:", forControlEvents: .TouchUpInside)

        birthdayView.incrementYearButton.addTarget(self, action: "incrementYearButtonDown:", forControlEvents: .TouchDown)
        birthdayView.incrementYearButton.addTarget(self, action: "resetButtonTransform:", forControlEvents: .TouchUpInside)

        birthdayView.decrementYearButton.addTarget(self, action: "decrementYearButtonDown:", forControlEvents: .TouchDown)
        birthdayView.decrementYearButton.addTarget(self, action: "resetButtonTransform:", forControlEvents: .TouchUpInside)

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
    private func incrementDayButtonDown(sender: UIButton) {
        tranformButton(sender)
        viewModel.incrementDay()
    }

    @objc
    private func decrementDayButtonDown(sender: UIButton) {
        tranformButton(sender)
        viewModel.decrementDay()
    }

    @objc
    private func incrementMonthButtonDown(sender: UIButton) {
        tranformButton(sender)
        viewModel.incrementMonth()
    }

    @objc
    private func decrementMonthButtonDown(sender: UIButton) {
        tranformButton(sender)
        viewModel.decrementMonth()
    }

    @objc
    private func incrementYearButtonDown(sender: UIButton) {
        tranformButton(sender)
        viewModel.incrementYear()
    }

    @objc
    private func decrementYearButtonDown(sender: UIButton) {
        tranformButton(sender)
        viewModel.decrementYear()
    }

    @objc
    private func saveBirthday(sender: AnyObject) {
        viewModel.saveBirthdayIntoUserDefaults(NSUserDefaults.standardUserDefaults())
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

    //MARK: Gesture Recognizer Actions

    @objc
    private func longPressIncrementDay(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        if (longPressGestureRecognizer.state == .Began) {
            longPressTimer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: viewModel, selector: "incrementDay", userInfo: nil, repeats: true)
        }

        if (longPressGestureRecognizer.state == .Ended) {
            longPressTimer?.invalidate()

            let birthdayView = view as! BirthdayView
            resetButtonTransform(birthdayView.incrementDayButton)
        }
    }

    @objc
    private func longPressIncrementMonth(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        if (longPressGestureRecognizer.state == .Began) {
            longPressTimer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: viewModel, selector: "incrementMonth", userInfo: nil, repeats: true)
        }

        if (longPressGestureRecognizer.state == .Ended) {
            longPressTimer?.invalidate()

            let birthdayView = view as! BirthdayView
            resetButtonTransform(birthdayView.incrementMonthButton)
        }
    }

    @objc
    private func longPressIncrementYear(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        if (longPressGestureRecognizer.state == .Began) {
            longPressTimer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: viewModel, selector: "incrementYear", userInfo: nil, repeats: true)
        }

        if (longPressGestureRecognizer.state == .Ended) {
            longPressTimer?.invalidate()

            let birthdayView = view as! BirthdayView
            resetButtonTransform(birthdayView.incrementYearButton)
        }
    }

    @objc
    private func longPressDecrementDay(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        if (longPressGestureRecognizer.state == .Began) {
            longPressTimer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: viewModel, selector: "decrementDay", userInfo: nil, repeats: true)
        }

        if (longPressGestureRecognizer.state == .Ended) {
            longPressTimer?.invalidate()

            let birthdayView = view as! BirthdayView
            resetButtonTransform(birthdayView.decrementDayButton)
        }
    }

    @objc
    private func longPressDecrementMonth(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        if (longPressGestureRecognizer.state == .Began) {
            longPressTimer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: viewModel, selector: "decrementMonth", userInfo: nil, repeats: true)
        }

        if (longPressGestureRecognizer.state == .Ended) {
            longPressTimer?.invalidate()

            let birthdayView = view as! BirthdayView
            resetButtonTransform(birthdayView.decrementMonthButton)
        }
    }

    @objc
    private func longPressDecrementYear(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        if (longPressGestureRecognizer.state == .Began) {
            longPressTimer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: viewModel, selector: "decrementYear", userInfo: nil, repeats: true)
        }

        if (longPressGestureRecognizer.state == .Ended) {
            longPressTimer?.invalidate()

            let birthdayView = view as! BirthdayView
            resetButtonTransform(birthdayView.decrementYearButton)
        }
    }

    //MARK: Button Transform

    private func tranformButton(button: UIButton) {
        UIView.animateWithDuration(0.1, animations: {
            button.layer.transform = CATransform3DMakeScale(0.8, 0.8, 1.0)
        })
    }

    @objc
    private func resetButtonTransform(button: UIButton) {
        UIView.animateWithDuration(0.2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: .CurveEaseInOut, animations: {
            button.layer.transform = CATransform3DIdentity
        }, completion: nil)
    }
}
