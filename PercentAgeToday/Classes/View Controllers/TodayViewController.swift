//
//  TodayViewController.swift
//  PercentAgeToday
//
//  Created by Julian Grosshauser on 28/04/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import UIKit
import NotificationCenter
import PercentAgeKit

@objc(TodayViewController)

class TodayViewController: UIViewController {

    //MARK: Properties

    private let viewModel = AgeViewModel()

    //MARK: UIViewController

    override func loadView() {
        view = TodayView()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        preferredContentSize = CGSize(width: 0, height: 50)

        let todayView = view as! TodayView

        let userDefaults = NSUserDefaults(suiteName: "group.com.juliangrosshauser.PercentAge")!

        if let birthday = userDefaults.objectForKey("birthday") as? NSDate {
            let age = viewModel.ageInPercent(birthday: birthday, today: NSDate())
            let ageInPercent = NSString(format: "%.2f", age) as String

            todayView.ageLabel.text = "You are \(ageInPercent) years old"
        } else {
            todayView.ageLabel.text = "Open PercentAge to set your birthday"
        }

        todayView.ageLabel.sizeToFit()
    }
}

//MARK: NCWidgetProviding

extension TodayViewController: NCWidgetProviding {

    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        completionHandler(.NoData)
    }

    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsetsZero
    }
}
