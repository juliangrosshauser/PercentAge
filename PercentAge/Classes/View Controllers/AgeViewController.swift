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

    let ageLabel = UILabel()
    let viewModel = AgeViewModel()

    //MARK: UIViewController

    override public func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let defaults = NSUserDefaults.standardUserDefaults()

        if let birthday = defaults.objectForKey("birthday") as? NSDate {
            let age = viewModel.ageInPercent(birthday: birthday, today: NSDate())

            ageLabel.text = NSString(format: "%.2f", age) as String

            ageLabel.sizeToFit()
            ageLabel.center = view.center
        } else {
            presentViewController(BirthdayViewController(), animated: false, completion: nil)
        }
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        let calendarButton = UIBarButtonItem(image: UIImage(named: "Calendar"), style: .Plain, target: self, action: "showBirthdaySettings:")
        navigationItem.leftBarButtonItem = calendarButton

        ageLabel.textAlignment = .Center
        ageLabel.font = UIFont(name: "Avenir Next", size: 36)
        ageLabel.textColor = .whiteColor()

        view.addSubview(ageLabel)

        let preAgeLabel = UILabel()
        preAgeLabel.text = "You are"
        preAgeLabel.textAlignment = .Center
        preAgeLabel.font = UIFont(name: "Avenir Next", size: 20)
        preAgeLabel.textColor = .whiteColor()
        preAgeLabel.sizeToFit()
        preAgeLabel.center.x = view.center.x - 100
        preAgeLabel.center.y = view.center.y

        view.addSubview(preAgeLabel)

        let postAgeLabel = UILabel()
        postAgeLabel.text = "years old."
        postAgeLabel.textAlignment = .Center
        postAgeLabel.font = UIFont(name: "Avenir Next", size: 20)
        postAgeLabel.textColor = .whiteColor()
        postAgeLabel.sizeToFit()
        postAgeLabel.center.x = view.center.x + 100
        postAgeLabel.center.y = view.center.y

        view.addSubview(postAgeLabel)

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(origin: CGPointZero, size: view.bounds.size)
        let gradientColors = [UIColor(red:0.24, green:0.49, blue:0.82, alpha:1).CGColor, UIColor(red:0.14, green:0.82, blue:0.99, alpha:1).CGColor]
        gradientLayer.colors = gradientColors
        view.layer.insertSublayer(gradientLayer, atIndex: 0)
    }

    //MARK: Settings

    @objc
    private func showBirthdaySettings(sender: AnyObject) {
        presentViewController(BirthdayViewController(), animated: true, completion: nil)
    }
}

