//
//  AgeViewModel.swift
//  PercentAgeKit
//
//  Created by Julian Grosshauser on 07/04/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import Foundation

public class AgeViewModel {

    //MARK: Properties

    private(set) public var age: String?

    //MARK: Initialization

    public init() {
        let userDefaults = NSUserDefaults(suiteName: "group.com.juliangrosshauser.PercentAge")!
        
        if let birthday = userDefaults.objectForKey("birthday") as? NSDate {
            let age = ageInPercent(birthday: birthday, today: NSDate())

            self.age = NSString(format: "%.2f", age) as String
        } else {
            age = nil
        }
    }

    //MARK: Date Calculations

    public func ageInPercent(#birthday: NSDate, today: NSDate) -> Float {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!

        let currentYear = calendar.component(.CalendarUnitYear, fromDate: today)
        let birthdayDay = calendar.component(.CalendarUnitDay, fromDate: birthday)
        let birthdayMonth = calendar.component(.CalendarUnitMonth, fromDate: birthday)

        let birthdayCurrentYearComponents = NSDateComponents()
        birthdayCurrentYearComponents.day = birthdayDay
        birthdayCurrentYearComponents.month = birthdayMonth
        birthdayCurrentYearComponents.year = currentYear

        let birthdayCurrentYear = calendar.dateFromComponents(birthdayCurrentYearComponents)!

        let yearDifferenceComponent = calendar.components(.CalendarUnitYear, fromDate: birthday, toDate: today, options: .allZeros)
        let years = yearDifferenceComponent.year

        if (calendar.isDate(birthdayCurrentYear, inSameDayAsDate: today)) {
            return Float(years)
        }

        let difference = dayDifference(before: birthdayCurrentYear, after: today)

        var percent: Float!

        // difference is negative if birthdayCurrentYear is after today
        if (difference < 0) {
            let birthdayLastYearComponents = NSDateComponents()
            birthdayLastYearComponents.day = birthdayDay
            birthdayLastYearComponents.month = birthdayMonth
            birthdayLastYearComponents.year = currentYear - 1

            let birthdayLastYear = calendar.dateFromComponents(birthdayLastYearComponents)!

            let daysBetweenBirthdays = dayDifference(before: birthdayLastYear, after: birthdayCurrentYear)
            let daysSinceBirthday = dayDifference(before: birthdayLastYear, after: today)

            let onePercent = Float(daysBetweenBirthdays) / Float(100);
            percent = Float(daysSinceBirthday) / onePercent / 100;
        } else {
            let birthdayNextYearComponents = NSDateComponents()
            birthdayNextYearComponents.day = birthdayDay
            birthdayNextYearComponents.month = birthdayMonth
            birthdayNextYearComponents.year = currentYear + 1

            let birthdayNextYear = calendar.dateFromComponents(birthdayNextYearComponents)!

            let daysBetweenBirthdays = dayDifference(before: birthdayCurrentYear, after: birthdayNextYear)
            let daysSinceBirthday = dayDifference(before: birthdayCurrentYear, after: today)

            let onePercent = Float(daysBetweenBirthdays) / Float(100);
            percent = Float(daysSinceBirthday) / onePercent / 100;
        }

        let ageInPercent = Float(years) + percent

        return ageInPercent
    }

    public func dayDifference(#before: NSDate, after: NSDate) -> Int {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let dayDifference = calendar!.components(.CalendarUnitDay, fromDate: before, toDate: after, options: .allZeros)
        
        return dayDifference.day
    }
}