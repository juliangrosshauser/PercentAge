//
//  BirthdayViewModel.swift
//  Age
//
//  Created by Julian Grosshauser on 09/04/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import Foundation

public class BirthdayViewModel {

    //MARK: Properties

    private(set) public var day: Int
    private(set) public var month: Int
    private(set) public var year: Int

    //MARK: Initialization

    convenience public init() {
        self.init(day: 1, month: 1, year: 2015)
    }

    public init(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }

    //MARK: Button Actions
    
    public func incrementDay() {
        if (self.day == 31) {
            self.day = 1
        } else {
            self.day++
        }
    }
    
    public func decrementDay() {
        if (self.day == 1) {
            self.day = 31
        } else {
            self.day--
        }
    }
    
    public func incrementMonth() {
        if (self.month == 12) {
            self.month = 1
        } else {
            self.month++
        }
    }
    
    public func decrementMonth() {
        if (self.month == 1) {
            self.month = 12
        } else {
            self.month--
        }
    }
    
    public func incrementYear() {
        if (self.year == 2015) {
            self.year = 1900
        } else {
            self.year++
        }
    }
    
    public func decrementYear() {
        if (self.year == 1900) {
            self.year = 2015
        } else {
            self.year--
        }
    }

    public func saveBirthday() {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"

        let day = NSString(format: "%02d", self.day)
        let month = NSString(format: "%02d", self.month)

        let birthday = dateFormatter.dateFromString("\(day)-\(month)-\(self.year)")

        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(birthday, forKey: "birthday")
    }
}