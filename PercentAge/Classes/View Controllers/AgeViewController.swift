//
//  AgeViewController.swift
//  PercentAge
//
//  Created by Julian Grosshauser on 14/03/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import UIKit

public class AgeViewController: UIViewController {

    //MARK: Properties

    var ageLabel = UILabel()
    var viewModel = AgeViewModel()

    //MARK: UIViewController

    override public func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let defaults = NSUserDefaults.standardUserDefaults()

        if let birthday = defaults.objectForKey("birthday") as? NSDate {
            let age = self.viewModel.ageInPercent(birthday: birthday, today: NSDate())

            self.ageLabel.text = NSString(format: "%.2f", age) as String

            self.ageLabel.sizeToFit()
            self.ageLabel.center = self.view.center
        } else {
            self.presentViewController(BirthdayViewController(), animated: false, completion: nil)
        }
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        let calendarButton = UIBarButtonItem(image: UIImage(named: "Calendar"), style: .Plain, target: self, action: "showBirthdaySettings:")
        self.navigationItem.leftBarButtonItem = calendarButton

        self.ageLabel.textAlignment = .Center
        self.ageLabel.font = UIFont(name: "Avenir Next", size: 36)
        self.ageLabel.textColor = .whiteColor()

        self.view.addSubview(self.ageLabel)

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(origin: CGPointZero, size: self.view.bounds.size)
        let gradientColors = [UIColor(red:0.24, green:0.49, blue:0.82, alpha:1).CGColor, UIColor(red:0.14, green:0.82, blue:0.99, alpha:1).CGColor]
        gradientLayer.colors = gradientColors
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
    }

    //MARK: Settings

    @objc
    private func showBirthdaySettings(sender: AnyObject) {
        self.presentViewController(BirthdayViewController(), animated: true, completion: nil)
    }
}

