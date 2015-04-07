//
//  AgeViewModel.swift
//  Age
//
//  Created by Julian Grosshauser on 07/04/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import Foundation

public class AgeViewModel {

    //MARK: Initialization

    // tests need a public init method to create AgeViewModel objects
    public init() { }

    //MARK: Date Calculations

    public func ageInPercent(#birthday: NSDate, today: NSDate) -> Float {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)

        let currentYear = calendar!.component(NSCalendarUnit.CalendarUnitYear, fromDate: today)
        let birthdayDay = calendar!.component(NSCalendarUnit.CalendarUnitDay, fromDate: birthday)
        let birthdayMonth = calendar!.component(NSCalendarUnit.CalendarUnitMonth, fromDate: birthday)

        let birthdayCurrentYearComponents = NSDateComponents()
        birthdayCurrentYearComponents.day = birthdayDay
        birthdayCurrentYearComponents.month = birthdayMonth
        birthdayCurrentYearComponents.year = currentYear

        let birthdayCurrentYear = calendar!.dateFromComponents(birthdayCurrentYearComponents)!

        let yearDifferenceComponent = calendar?.components(NSCalendarUnit.CalendarUnitYear, fromDate: birthday, toDate: today, options: NSCalendarOptions.allZeros)
        let years = yearDifferenceComponent!.year

        if (calendar!.isDate(birthdayCurrentYear, inSameDayAsDate: today)) {
            return Float(years)
        }

        let dayDifference = self.dayDifference(before: birthdayCurrentYear, after: today)

        var percent: Float!

        // dayDifference is negative if birthdayCurrentYear is after today
        if (dayDifference < 0) {
            let birthdayLastYearComponents = NSDateComponents()
            birthdayLastYearComponents.day = birthdayDay
            birthdayLastYearComponents.month = birthdayMonth
            birthdayLastYearComponents.year = currentYear - 1

            let birthdayLastYear = calendar!.dateFromComponents(birthdayLastYearComponents)!

            let daysBetweenBirthdays = self.dayDifference(before: birthdayLastYear, after: birthdayCurrentYear)
            let daysSinceBirthday = self.dayDifference(before: birthdayLastYear, after: today)

            let onePercent = Float(daysBetweenBirthdays) / Float(100);
            percent = Float(daysSinceBirthday) / onePercent / 100;
        } else {
            let birthdayNextYearComponents = NSDateComponents()
            birthdayNextYearComponents.day = birthdayDay
            birthdayNextYearComponents.month = birthdayMonth
            birthdayNextYearComponents.year = currentYear + 1

            let birthdayNextYear = calendar!.dateFromComponents(birthdayNextYearComponents)!

            let daysBetweenBirthdays = self.dayDifference(before: birthdayCurrentYear, after: birthdayNextYear)
            let daysSinceBirthday = self.dayDifference(before: birthdayCurrentYear, after: today)

            let onePercent = Float(daysBetweenBirthdays) / Float(100);
            percent = Float(daysSinceBirthday) / onePercent / 100;
        }

        let ageInPercent = Float(years) + percent

        return ageInPercent
    }

    public func dayDifference(#before: NSDate, after: NSDate) -> Int {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let dayDifference = calendar!.components(NSCalendarUnit.CalendarUnitDay, fromDate: before, toDate: after, options: NSCalendarOptions.allZeros)
        
        return dayDifference.day
    }
}