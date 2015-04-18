//
//  BirthdayViewModelSpec.swift
//  PercentAgeTests
//
//  Created by Julian Grosshauser on 09/04/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import Quick
import Nimble
import PercentAge

class BirthdayViewModelSpec: QuickSpec {

    override func spec() {
        describe("BirthdayViewModel") {
            describe("incrementDay") {
                context("day value is at bottom limit") {
                    it("increments day value") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 1, year: 2015)
                        birthdayViewModel.incrementDay(self)
                        expect(birthdayViewModel.day).to(equal(2))
                    }
                }

                context("day value is at upper limit") {
                    it("sets day value to bottom limit") {
                        let birthdayViewModel = BirthdayViewModel(day: 31, month: 1, year: 2015)
                        birthdayViewModel.incrementDay(self)
                        expect(birthdayViewModel.day).to(equal(1))
                    }
                }
            }

            describe("decrementDay") {
                context("day value is at bottom limit") {
                    it("sets day value to upper limit") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 1, year: 2015)
                        birthdayViewModel.decrementDay(self)
                        expect(birthdayViewModel.day).to(equal(31))
                    }
                }

                context("day value is at upper limit") {
                    it("decrements day value") {
                        let birthdayViewModel = BirthdayViewModel(day: 31, month: 1, year: 2015)
                        birthdayViewModel.decrementDay(self)
                        expect(birthdayViewModel.day).to(equal(30))
                    }
                }
            }

            describe("incrementMonth") {
                context("month value is at bottom limit") {
                    it("increments month value") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 1, year: 2015)
                        birthdayViewModel.incrementMonth(self)
                        expect(birthdayViewModel.month).to(equal(2))
                    }
                }

                context("month value is at upper limit") {
                    it("sets month value to bottom limit") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 12, year: 2015)
                        birthdayViewModel.incrementMonth(self)
                        expect(birthdayViewModel.month).to(equal(1))
                    }
                }
            }

            describe("decrementMonth") {
                context("month value is at bottom limit") {
                    it("sets month value to upper limit") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 1, year: 2015)
                        birthdayViewModel.decrementMonth(self)
                        expect(birthdayViewModel.month).to(equal(12))
                    }
                }

                context("month value is at upper limit") {
                    it("decrements month value") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 12, year: 2015)
                        birthdayViewModel.decrementMonth(self)
                        expect(birthdayViewModel.month).to(equal(11))
                    }
                }
            }

            describe("incrementYear") {
                context("year value is at bottom limit") {
                    it("increments year value") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 1, year: 1900)
                        birthdayViewModel.incrementYear(self)
                        expect(birthdayViewModel.year).to(equal(1901))
                    }
                }

                context("year value is at upper limit") {
                    it("sets year value to bottom limit") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 1, year: 2015)
                        birthdayViewModel.incrementYear(self)
                        expect(birthdayViewModel.year).to(equal(1900))
                    }
                }
            }

            describe("decrementYear") {
                context("year value is at bottom limit") {
                    it("sets year value to upper limit") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 1, year: 1900)
                        birthdayViewModel.decrementYear(self)
                        expect(birthdayViewModel.year).to(equal(2015))
                    }
                }

                context("year value is at upper limit") {
                    it("decrements year value") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 1, year: 2015)
                        birthdayViewModel.decrementYear(self)
                        expect(birthdayViewModel.year).to(equal(2014))
                    }
                }
            }

            describe("saveBirthday") {
                var userDefaults: NSUserDefaults!

                beforeEach {
                    userDefaults = NSUserDefaults()

                    // clear user defaults
                    if let domainName = NSBundle.mainBundle().bundleIdentifier {
                        userDefaults.removePersistentDomainForName(domainName)
                    }
                }

                afterEach {
                    // clear user defaults
                    if let domainName = NSBundle.mainBundle().bundleIdentifier {
                        userDefaults.removePersistentDomainForName(domainName)
                    }
                }

                it("saves birthday into user defaults") {
                    expect(userDefaults.objectForKey("birthday")).to(beNil())

                    let birthdayViewModel = BirthdayViewModel()
                    birthdayViewModel.saveBirthdayIntoUserDefaults(userDefaults)

                    expect(userDefaults.objectForKey("birthday")).toNot(beNil())
                }
            }
        }
    }
}
