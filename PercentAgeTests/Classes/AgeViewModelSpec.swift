//
//  AgeViewModelSpec.swift
//  PercentAgeTests
//
//  Created by Julian Grosshauser on 14/03/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import Quick
import Nimble
import PercentAgeKit

class AgeViewModelSpec: QuickSpec {

    override func spec() {
        var dateFormatter: NSDateFormatter!

        beforeSuite {
            dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
        }

        describe("AgeViewModel") {
            var ageViewModel: AgeViewModel!

            beforeEach {
                ageViewModel = AgeViewModel()
            }

            //MARK: ageInPercent

            describe("ageInPercent") {
                var birthday: NSDate!
                var today: NSDate!

                context("when birthday is today") {
                    beforeEach {
                        birthday = dateFormatter.dateFromString("06-03-1991")
                        today = dateFormatter.dateFromString("06-03-2015")
                    }
                    
                    it("returns whole number") {
                        let ageInPercent = ageViewModel.ageInPercent(birthday: birthday, today: today)
                        let ageInPercentRoundedString = NSString(format: "%.2f", ageInPercent)
                        expect(ageInPercentRoundedString).to(equal("24.00"))
                    }
                }

                context("when birthday hasn't happened this year yet") {
                    beforeEach {
                        // difference of 31 days
                        birthday = dateFormatter.dateFromString("06-03-1991")
                        today = dateFormatter.dateFromString("03-02-2015")
                    }

                    it("returns correct age in percent") {
                        let ageInPercent = ageViewModel.ageInPercent(birthday: birthday, today: today)
                        let ageInPercentRoundedString = NSString(format: "%.2f", ageInPercent)
                        expect(ageInPercentRoundedString).to(equal("23.92"))
                    }
                }

                context("when birthday has happened this year already") {
                    beforeEach {
                        // difference of 31 days
                        birthday = dateFormatter.dateFromString("06-03-1991")
                        today = dateFormatter.dateFromString("06-04-2015")
                    }

                    it("returns correct age in percent") {
                        let ageInPercent = ageViewModel.ageInPercent(birthday: birthday, today: today)
                        let ageInPercentRoundedString = NSString(format: "%.2f", ageInPercent)
                        expect(ageInPercentRoundedString).to(equal("24.08"))
                    }
                }
            }

            //MARK: dayDifference

            describe("dayDifference") {
                var before: NSDate!
                var after: NSDate!

                context("dates are in same year") {
                    context("dates are in same month") {
                        context("dates are on same day") {
                            it("returns correct number of days") {
                                before = dateFormatter.dateFromString("06-03-1991")
                                after = dateFormatter.dateFromString("06-03-1991")

                                let days = ageViewModel.dayDifference(before: before, after: after)
                                expect(days).to(equal(0))
                            }
                        }

                        context("dates are on different days") {
                            it("returns correct number of days") {
                                before = dateFormatter.dateFromString("06-03-1991")
                                after = dateFormatter.dateFromString("27-03-1991")

                                let days = ageViewModel.dayDifference(before: before, after: after)
                                expect(days).to(equal(21))
                            }
                        }
                    }

                    context("dates are in different months") {
                        context("dates are on same day") {
                            it("returns correct number of days") {
                                before = dateFormatter.dateFromString("06-03-1991")
                                after = dateFormatter.dateFromString("06-05-1991")

                                let days = ageViewModel.dayDifference(before: before, after: after)
                                expect(days).to(equal(61))
                            }
                        }

                        context("dates are on different days") {
                            it("returns correct number of days") {
                                before = dateFormatter.dateFromString("06-03-1991")
                                after = dateFormatter.dateFromString("18-04-1991")

                                let days = ageViewModel.dayDifference(before: before, after: after)
                                expect(days).to(equal(43))
                            }
                        }
                    }
                }

                context("dates are in different years") {
                    context("dates are in same month") {
                        context("dates are on same day") {
                            it("returns correct number of days") {
                                // 1992 is a leap year
                                before = dateFormatter.dateFromString("06-03-1991")
                                after = dateFormatter.dateFromString("06-03-1993")

                                let days = ageViewModel.dayDifference(before: before, after: after)
                                expect(days).to(equal(731))
                            }
                        }

                        context("dates are on different days") {
                            it("returns correct number of days") {
                                // 1992 is a leap year
                                before = dateFormatter.dateFromString("06-03-1991")
                                after = dateFormatter.dateFromString("11-03-1993")

                                let days = ageViewModel.dayDifference(before: before, after: after)
                                expect(days).to(equal(736))
                            }
                        }
                    }

                    context("dates are in different months") {
                        context("dates are on same day") {
                            it("returns correct number of days") {
                                // 1992 is a leap year
                                before = dateFormatter.dateFromString("06-03-1991")
                                after = dateFormatter.dateFromString("06-04-1993")

                                let days = ageViewModel.dayDifference(before: before, after: after)
                                expect(days).to(equal(762))
                            }
                        }

                        context("dates are on different days") {
                            it("returns correct number of days") {
                                // 1992 is a leap year
                                before = dateFormatter.dateFromString("06-03-1991")
                                after = dateFormatter.dateFromString("14-05-1993")

                                let days = ageViewModel.dayDifference(before: before, after: after)
                                expect(days).to(equal(800))
                            }
                        }
                    }
                }

                context("before and after dates are switched") {
                    it("returns negative number of days") {
                        before = dateFormatter.dateFromString("06-03-1991")
                        after = dateFormatter.dateFromString("07-03-1991")

                        let days = ageViewModel.dayDifference(before: after, after: before)
                        expect(days).to(equal(-1))
                    }
                }
            }
        }
    }
}
