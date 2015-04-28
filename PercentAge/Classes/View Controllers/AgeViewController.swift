//
//  AgeViewController.swift
//  PercentAge
//
//  Created by Julian Grosshauser on 14/03/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import UIKit

class AgeViewController: UIViewController {

    //MARK: Properties

    private let viewModel = AgeViewModel()

    private let ageLabel = UILabel()
    private let preAgeLabel = UILabel()
    private let postAgeLabel = UILabel()

    //MARK: UIViewController

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let defaults = NSUserDefaults.standardUserDefaults()

        if let birthday = defaults.objectForKey("birthday") as? NSDate {
            let age = viewModel.ageInPercent(birthday: birthday, today: NSDate())

            ageLabel.text = NSString(format: "%.2f", age) as String

            ageLabel.sizeToFit()
        } else {
            presentViewController(BirthdayViewController(), animated: false, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let calendarButton = UIBarButtonItem(image: UIImage(named: "Calendar"), style: .Plain, target: self, action: "showBirthdaySettings:")
        navigationItem.leftBarButtonItem = calendarButton

        ageLabel.textAlignment = .Center
        ageLabel.font = UIFont(name: "Avenir Next", size: 36)
        ageLabel.textColor = .whiteColor()

        view.addSubview(ageLabel)

        preAgeLabel.text = "You are"
        preAgeLabel.textAlignment = .Center
        preAgeLabel.font = UIFont(name: "Avenir Next", size: 20)
        preAgeLabel.textColor = .whiteColor()
        preAgeLabel.sizeToFit()

        view.addSubview(preAgeLabel)

        postAgeLabel.text = "years old."
        postAgeLabel.textAlignment = .Center
        postAgeLabel.font = UIFont(name: "Avenir Next", size: 20)
        postAgeLabel.textColor = .whiteColor()
        postAgeLabel.sizeToFit()

        view.addSubview(postAgeLabel)

        let gradientLayer = CAGradientLayer()
        let gradientColors = [UIColor(red:0.24, green:0.49, blue:0.82, alpha:1).CGColor, UIColor(red:0.14, green:0.82, blue:0.99, alpha:1).CGColor]
        gradientLayer.colors = gradientColors
        view.layer.insertSublayer(gradientLayer, atIndex: 0)
    }

    override func viewWillLayoutSubviews() {
        ageLabel.center = view.center

        preAgeLabel.center.x = view.center.x - 100
        preAgeLabel.center.y = view.center.y

        postAgeLabel.center.x = view.center.x + 100
        postAgeLabel.center.y = view.center.y

        if let gradientLayer = view.layer.sublayers[0] as? CAGradientLayer {
            gradientLayer.frame = view.frame
        }
    }

    //MARK: Settings

    @objc
    private func showBirthdaySettings(sender: AnyObject) {
        presentViewController(BirthdayViewController(), animated: true, completion: nil)
    }
}

