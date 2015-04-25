//
//  BirthdayViewModel.swift
//  PercentAge
//
//  Created by Julian Grosshauser on 09/04/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import Foundation

public class BirthdayViewModel: NSObject {

    //MARK: Properties

    static public var observeContext = 0

    dynamic private(set) public var day: Int
    dynamic private(set) public var month: Int
    dynamic private(set) public var year: Int

    //MARK: Initialization

    convenience public override init() {
        let day: Int
        let month: Int
        let year: Int
        let defaults = NSUserDefaults.standardUserDefaults()
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!

        if let birthday = defaults.objectForKey("birthday") as? NSDate {
            let birthdayComponents = calendar.components(.CalendarUnitDay | .CalendarUnitMonth | .CalendarUnitYear, fromDate: birthday)

            day = birthdayComponents.day
            month = birthdayComponents.month
            year = birthdayComponents.year
        } else {
            let todayComponents = calendar.components(.CalendarUnitDay | .CalendarUnitMonth | .CalendarUnitYear, fromDate: NSDate())

            day = todayComponents.day
            month = todayComponents.month
            year = todayComponents.year
        }

        self.init(day: day, month: month, year: year)
    }

    public init(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }

    //MARK: Increment/Decrement Properties

    public func incrementDay() {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let dateComponents = NSDateComponents()
        let todayComponents = calendar.components(.CalendarUnitDay | .CalendarUnitMonth | .CalendarUnitYear, fromDate: NSDate())

        dateComponents.month = self.month
        dateComponents.year = self.year
        let dayRange = calendar.rangeOfUnit(.CalendarUnitDay, inUnit: .CalendarUnitMonth, forDate: calendar.dateFromComponents(dateComponents)!)

        if (todayComponents.year == self.year &&
            todayComponents.month == self.month &&
            todayComponents.day == self.day ||
            self.day == dayRange.length) {
            self.day = 1
        } else {
            self.day++
        }
    }

    public func decrementDay() {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let dateComponents = NSDateComponents()

        dateComponents.month = self.month
        dateComponents.year = self.year
        let dayRange = calendar.rangeOfUnit(.CalendarUnitDay, inUnit: .CalendarUnitMonth, forDate: calendar.dateFromComponents(dateComponents)!)

        if (self.day == 1) {
            let todayComponents = calendar.components(.CalendarUnitDay | .CalendarUnitMonth | .CalendarUnitYear, fromDate: NSDate())

            if (todayComponents.year == self.year && todayComponents.month == self.month) {
                self.day = todayComponents.day
            } else {
                self.day = dayRange.length
            }
        } else {
            self.day--
        }
    }

    public func incrementMonth() {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let currentMonthComponents = calendar.components(.CalendarUnitMonth | .CalendarUnitYear, fromDate: NSDate())

        if (currentMonthComponents.year == self.year &&
            currentMonthComponents.month == self.month ||
            self.month == 12) {
            self.month = 1
        } else {
            self.month++
        }
    }

    public func decrementMonth() {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let currentMonthComponents = calendar.components(.CalendarUnitMonth | .CalendarUnitYear, fromDate: NSDate())

        if (self.month == 1) {
            if (currentMonthComponents.year == self.year) {
                self.month = currentMonthComponents.month
            } else {
                self.month = 12
            }
        } else {
            self.month--
        }
    }

    public func incrementYear() {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let currentYear = calendar.component(.CalendarUnitYear, fromDate: NSDate())

        if (self.year == currentYear) {
            self.year = 1900
        } else {
            self.year++
        }
    }

    public func decrementYear() {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let currentYear = calendar.component(.CalendarUnitYear, fromDate: NSDate())

        if (self.year == 1900) {
            self.year = currentYear
        } else {
            self.year--
        }
    }

    //MARK: Save Properties

    public func saveBirthdayIntoUserDefaults(userDefaults: NSUserDefaults) {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let birthdayComponents = NSDateComponents()

        birthdayComponents.day = self.day
        birthdayComponents.month = self.month
        birthdayComponents.year = self.year

        let birthday = calendar.dateFromComponents(birthdayComponents)

        userDefaults.setObject(birthday, forKey: "birthday")
    }
}
