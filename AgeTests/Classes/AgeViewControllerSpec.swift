//
//  AgeTests.swift
//  AgeViewControllerSpec
//
//  Created by Julian Grosshauser on 14/03/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import Quick
import Nimble
import Age

class AgeViewControllerSpec: QuickSpec {

    override func spec() {
        var dateFormatter: NSDateFormatter!

        beforeSuite {
            dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
        }

        describe("AgeViewController") {
            var ageViewController: AgeViewController!

            beforeEach {
                ageViewController = AgeViewController()
            }

            describe("ageInPercent") {
                var birthday: NSDate!
                var today: NSDate!

                context("when birthday is today") {
                    beforeEach {
                        birthday = dateFormatter.dateFromString("06-03-1991")
                        today = dateFormatter.dateFromString("06-03-2015")
                    }
                    
                    it("returns whole number") {
                        let ageInPercent = ageViewController.ageInPercent(birthday: birthday, today: today)
                        let ageInPercentRoundedString = NSString(format: "%.2f", ageInPercent)
                        expect(ageInPercentRoundedString).to(equal("24.00"))
                    }
                }
            }
        }
    }
}
