//
//  TodayViewController.swift
//  PercentAgeTodayExtension
//
//  Created by Julian Grosshauser on 28/04/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TodayViewController: NCWidgetProviding {

    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        completionHandler(.NoData)
    }
}
