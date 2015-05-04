//
//  TodayViewController.swift
//  PercentAgeTodayExtension
//
//  Created by Julian Grosshauser on 28/04/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import UIKit
import NotificationCenter
import PercentAgeKit

@objc(TodayViewController)

class TodayViewController: UIViewController {

    override func loadView() {
        view = TodayView()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        preferredContentSize = CGSize(width: 0, height: 50)
    }
}

extension TodayViewController: NCWidgetProviding {

    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        completionHandler(.NoData)
    }

    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsetsZero
    }
}
