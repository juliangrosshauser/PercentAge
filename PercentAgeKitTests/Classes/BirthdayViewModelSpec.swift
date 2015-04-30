//
//  BirthdayViewModelSpec.swift
//  PercentAgeKitTests
//
//  Created by Julian Grosshauser on 09/04/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import Quick
import Nimble
import PercentAgeKit

class BirthdayViewModelSpec: QuickSpec {

    override func spec() {
        describe("BirthdayViewModel") {
            let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!

            //MARK: incrementDay

            describe("incrementDay") {
                context("day value is at bottom limit") {
                    it("increments day value") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 1, year: 2014)
                        birthdayViewModel.incrementDay()
                        expect(birthdayViewModel.day).to(equal(2))
                    }
                }

                context("day value is at upper limit") {
                    context("January") {
                        it("sets day value to bottom limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 31, month: 1, year: 2014)
                            birthdayViewModel.incrementDay()
                            expect(birthdayViewModel.day).to(equal(1))
                        }
                    }

                    context("February") {
                        it("sets day value to bottom limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 28, month: 2, year: 2014)
                            birthdayViewModel.incrementDay()
                            expect(birthdayViewModel.day).to(equal(1))
                        }

                        context("leap year") {
                            it("sets day value to bottom limit") {
                                let birthdayViewModel = BirthdayViewModel(day: 29, month: 2, year: 2012)
                                birthdayViewModel.incrementDay()
                                expect(birthdayViewModel.day).to(equal(1))
                            }
                        }
                    }

                    context("March") {
                        it("sets day value to bottom limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 31, month: 3, year: 2014)
                            birthdayViewModel.incrementDay()
                            expect(birthdayViewModel.day).to(equal(1))
                        }
                    }

                    context("April") {
                        it("sets day value to bottom limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 30, month: 4, year: 2014)
                            birthdayViewModel.incrementDay()
                            expect(birthdayViewModel.day).to(equal(1))
                        }
                    }

                    context("May") {
                        it("sets day value to bottom limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 31, month: 5, year: 2014)
                            birthdayViewModel.incrementDay()
                            expect(birthdayViewModel.day).to(equal(1))
                        }
                    }

                    context("June") {
                        it("sets day value to bottom limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 30, month: 6, year: 2014)
                            birthdayViewModel.incrementDay()
                            expect(birthdayViewModel.day).to(equal(1))
                        }
                    }

                    context("July") {
                        it("sets day value to bottom limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 31, month: 7, year: 2014)
                            birthdayViewModel.incrementDay()
                            expect(birthdayViewModel.day).to(equal(1))
                        }
                    }

                    context("August") {
                        it("sets day value to bottom limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 31, month: 8, year: 2014)
                            birthdayViewModel.incrementDay()
                            expect(birthdayViewModel.day).to(equal(1))
                        }
                    }

                    context("September") {
                        it("sets day value to bottom limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 30, month: 9, year: 2014)
                            birthdayViewModel.incrementDay()
                            expect(birthdayViewModel.day).to(equal(1))
                        }
                    }

                    context("October") {
                        it("sets day value to bottom limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 31, month: 10, year: 2014)
                            birthdayViewModel.incrementDay()
                            expect(birthdayViewModel.day).to(equal(1))
                        }
                    }

                    context("November") {
                        it("sets day value to bottom limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 30, month: 11, year: 2014)
                            birthdayViewModel.incrementDay()
                            expect(birthdayViewModel.day).to(equal(1))
                        }
                    }

                    context("December") {
                        it("sets day value to bottom limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 31, month: 12, year: 2014)
                            birthdayViewModel.incrementDay()
                            expect(birthdayViewModel.day).to(equal(1))
                        }
                    }

                    context("upper limit is today") {
                        it("sets day value to bottom limit") {
                            let todayComponents = calendar.components(.CalendarUnitDay | .CalendarUnitMonth | .CalendarUnitYear, fromDate: NSDate())
                            let birthdayViewModel = BirthdayViewModel(day: todayComponents.day, month: todayComponents.month, year: todayComponents.year)

                            birthdayViewModel.incrementDay()

                            expect(birthdayViewModel.day).to(equal(1))
                            expect(birthdayViewModel.month).to(equal(todayComponents.month))
                            expect(birthdayViewModel.year).to(equal(todayComponents.year))
                        }
                    }
                }
            }

            //MARK: decrementDay

            describe("decrementDay") {
                context("day value is at bottom limit") {
                    context("January") {
                        it("sets day value to upper limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 1, month: 1, year: 2014)
                            birthdayViewModel.decrementDay()
                            expect(birthdayViewModel.day).to(equal(31))
                        }
                    }

                    context("February") {
                        it("sets day value to upper limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 1, month: 2, year: 2014)
                            birthdayViewModel.decrementDay()
                            expect(birthdayViewModel.day).to(equal(28))
                        }

                        context("leap year") {
                            it("sets day value to upper limit") {
                                let birthdayViewModel = BirthdayViewModel(day: 1, month: 2, year: 2012)
                                birthdayViewModel.decrementDay()
                                expect(birthdayViewModel.day).to(equal(29))
                            }
                        }
                    }

                    context("March") {
                        it("sets day value to upper limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 1, month: 3, year: 2014)
                            birthdayViewModel.decrementDay()
                            expect(birthdayViewModel.day).to(equal(31))
                        }
                    }

                    context("April") {
                        it("sets day value to upper limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 1, month: 4, year: 2014)
                            birthdayViewModel.decrementDay()
                            expect(birthdayViewModel.day).to(equal(30))
                        }
                    }

                    context("May") {
                        it("sets day value to upper limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 1, month: 5, year: 2014)
                            birthdayViewModel.decrementDay()
                            expect(birthdayViewModel.day).to(equal(31))
                        }
                    }

                    context("June") {
                        it("sets day value to upper limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 1, month: 6, year: 2014)
                            birthdayViewModel.decrementDay()
                            expect(birthdayViewModel.day).to(equal(30))
                        }
                    }

                    context("July") {
                        it("sets day value to upper limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 1, month: 7, year: 2014)
                            birthdayViewModel.decrementDay()
                            expect(birthdayViewModel.day).to(equal(31))
                        }
                    }

                    context("August") {
                        it("sets day value to upper limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 1, month: 8, year: 2014)
                            birthdayViewModel.decrementDay()
                            expect(birthdayViewModel.day).to(equal(31))
                        }
                    }

                    context("September") {
                        it("sets day value to upper limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 1, month: 9, year: 2014)
                            birthdayViewModel.decrementDay()
                            expect(birthdayViewModel.day).to(equal(30))
                        }
                    }

                    context("October") {
                        it("sets day value to upper limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 1, month: 10, year: 2014)
                            birthdayViewModel.decrementDay()
                            expect(birthdayViewModel.day).to(equal(31))
                        }
                    }

                    context("November") {
                        it("sets day value to upper limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 1, month: 11, year: 2014)
                            birthdayViewModel.decrementDay()
                            expect(birthdayViewModel.day).to(equal(30))
                        }
                    }

                    context("December") {
                        it("sets day value to upper limit") {
                            let birthdayViewModel = BirthdayViewModel(day: 1, month: 12, year: 2014)
                            birthdayViewModel.decrementDay()
                            expect(birthdayViewModel.day).to(equal(31))
                        }
                    }

                    context("upper limit is today") {
                        it("sets day value to upper limit") {
                            let todayComponents = calendar.components(.CalendarUnitDay | .CalendarUnitMonth | .CalendarUnitYear, fromDate: NSDate())
                            let birthdayViewModel = BirthdayViewModel(day: 1, month: todayComponents.month, year: todayComponents.year)

                            birthdayViewModel.decrementDay()

                            expect(birthdayViewModel.day).to(equal(todayComponents.day))
                            expect(birthdayViewModel.month).to(equal(todayComponents.month))
                            expect(birthdayViewModel.year).to(equal(todayComponents.year))
                        }
                    }
                }

                context("day value is at upper limit") {
                    it("decrements day value") {
                        let birthdayViewModel = BirthdayViewModel(day: 31, month: 1, year: 2014)
                        birthdayViewModel.decrementDay()
                        expect(birthdayViewModel.day).to(equal(30))
                    }
                }
            }

            //MARK: incrementMonth

            describe("incrementMonth") {
                context("month value is at bottom limit") {
                    it("increments month value") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 1, year: 2014)
                        birthdayViewModel.incrementMonth()
                        expect(birthdayViewModel.month).to(equal(2))
                    }
                }

                context("month value is at upper limit") {
                    it("sets month value to bottom limit") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 12, year: 2014)
                        birthdayViewModel.incrementMonth()
                        expect(birthdayViewModel.month).to(equal(1))
                    }

                    context("upper limit is today") {
                        it("sets month value to bottom limit") {
                            let todayComponents = calendar.components(.CalendarUnitDay | .CalendarUnitMonth | .CalendarUnitYear, fromDate: NSDate())
                            let birthdayViewModel = BirthdayViewModel(day: todayComponents.day, month: todayComponents.month, year: todayComponents.year)

                            birthdayViewModel.incrementMonth()

                            expect(birthdayViewModel.day).to(equal(todayComponents.day))
                            expect(birthdayViewModel.month).to(equal(1))
                            expect(birthdayViewModel.year).to(equal(todayComponents.year))
                        }
                    }
                }
            }

            //MARK: decrementMonth

            describe("decrementMonth") {
                context("month value is at bottom limit") {
                    it("sets month value to upper limit") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 1, year: 2014)
                        birthdayViewModel.decrementMonth()
                        expect(birthdayViewModel.month).to(equal(12))
                    }

                    context("upper limit is today") {
                        it("sets month value to upper limit") {
                            let todayComponents = calendar.components(.CalendarUnitDay | .CalendarUnitMonth | .CalendarUnitYear, fromDate: NSDate())
                            let birthdayViewModel = BirthdayViewModel(day: todayComponents.day, month: 1, year: todayComponents.year)

                            birthdayViewModel.decrementMonth()

                            expect(birthdayViewModel.day).to(equal(todayComponents.day))
                            expect(birthdayViewModel.month).to(equal(todayComponents.month))
                            expect(birthdayViewModel.year).to(equal(todayComponents.year))
                        }
                    }
                }

                context("month value is at upper limit") {
                    it("decrements month value") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 12, year: 2014)
                        birthdayViewModel.decrementMonth()
                        expect(birthdayViewModel.month).to(equal(11))
                    }
                }
            }

            //MARK: incrementYear

            describe("incrementYear") {
                context("year value is at bottom limit") {
                    it("increments year value") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 1, year: 1900)
                        birthdayViewModel.incrementYear()
                        expect(birthdayViewModel.year).to(equal(1901))
                    }
                }

                context("year value is at upper limit") {
                    it("sets year value to bottom limit") {
                        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
                        let currentYear = calendar.component(.CalendarUnitYear, fromDate: NSDate())

                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 1, year: currentYear)
                        birthdayViewModel.incrementYear()
                        expect(birthdayViewModel.year).to(equal(1900))
                    }
                }
            }

            //MARK: decrementYear

            describe("decrementYear") {
                var currentYear: Int!

                beforeEach {
                    currentYear = calendar.component(.CalendarUnitYear, fromDate: NSDate())
                }

                context("year value is at bottom limit") {
                    it("sets year value to upper limit") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 1, year: 1900)
                        birthdayViewModel.decrementYear()
                        expect(birthdayViewModel.year).to(equal(currentYear))
                    }
                }

                context("year value is at upper limit") {
                    it("decrements year value") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 1, year: currentYear)
                        birthdayViewModel.decrementYear()
                        expect(birthdayViewModel.year).to(equal(currentYear - 1))
                    }
                }
            }

            //MARK: saveBirthday

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
