//
//  AgeViewController.swift
//  PercentAge
//
//  Created by Julian Grosshauser on 14/03/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import UIKit
import PercentAgeKit

class AgeViewController: UIViewController {

    //MARK: Properties

    private let viewModel = AgeViewModel()

    private let ageLabel: UILabel = {
        let label = UILabel()

        label.textAlignment = .Center
        label.font = UIFont(name: "Avenir Next", size: 36)
        label.textColor = .whiteColor()

        return label
    }()

    private let preAgeLabel: UILabel = {
        let label = UILabel()

        label.text = "You are"
        label.textAlignment = .Center
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.textColor = .whiteColor()
        label.sizeToFit()

        return label
    }()

    private let postAgeLabel: UILabel = {
        let label = UILabel()

        label.text = "years old."
        label.textAlignment = .Center
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.textColor = .whiteColor()
        label.sizeToFit()

        return label
    }()

    //MARK: UIViewController

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        if viewModel.age == nil {
            presentViewController(BirthdayViewController(), animated: false, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let calendarButton = UIBarButtonItem(image: UIImage(named: "Calendar"), style: .Plain, target: self, action: "showBirthdaySettings:")
        navigationItem.leftBarButtonItem = calendarButton

        if let age = viewModel.age {
            ageLabel.text = age
            ageLabel.sizeToFit()
        }

        view.addSubview(ageLabel)
        view.addSubview(preAgeLabel)
        view.addSubview(postAgeLabel)

        let gradientLayer = CAGradientLayer()
        let gradientColors = [UIColor(red:0.24, green:0.49, blue:0.82, alpha:1).CGColor, UIColor(red:0.14, green:0.82, blue:0.99, alpha:1).CGColor]
        gradientLayer.colors = gradientColors
        view.layer.insertSublayer(gradientLayer, atIndex: 0)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

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

