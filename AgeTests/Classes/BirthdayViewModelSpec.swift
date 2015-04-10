//
//  BirthdayViewModelSpec.swift
//  AgeTests
//
//  Created by Julian Grosshauser on 09/04/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import Quick
import Nimble
import Age

class BirthdayViewModelSpec: QuickSpec {

    override func spec() {
        describe("BirthdayViewModel") {
            describe("incrementDay") {
                context("day value is at bottom limit") {
                    it("increments day value") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 1, year: 2015)
                        birthdayViewModel.incrementDay()
                        expect(birthdayViewModel.day).to(equal(2))
                    }
                }

                context("day value is at upper limit") {
                    it("sets day value to bottom limit") {
                        let birthdayViewModel = BirthdayViewModel(day: 31, month: 1, year: 2015)
                        birthdayViewModel.incrementDay()
                        expect(birthdayViewModel.day).to(equal(1))
                    }
                }
            }

            describe("decrementDay") {
                context("day value is at bottom limit") {
                    it("sets day value to upper limit") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 1, year: 2015)
                        birthdayViewModel.decrementDay()
                        expect(birthdayViewModel.day).to(equal(31))
                    }
                }

                context("day value is at upper limit") {
                    it("decrements day value") {
                        let birthdayViewModel = BirthdayViewModel(day: 31, month: 1, year: 2015)
                        birthdayViewModel.decrementDay()
                        expect(birthdayViewModel.day).to(equal(30))
                    }
                }
            }

            describe("incrementMonth") {
                context("month value is at bottom limit") {
                    it("increments month value") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 1, year: 2015)
                        birthdayViewModel.incrementMonth()
                        expect(birthdayViewModel.month).to(equal(2))
                    }
                }

                context("month value is at upper limit") {
                    it("sets month value to bottom limit") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 12, year: 2015)
                        birthdayViewModel.incrementMonth()
                        expect(birthdayViewModel.month).to(equal(1))
                    }
                }
            }

            describe("decrementMonth") {
                context("month value is at bottom limit") {
                    it("sets month value to upper limit") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 1, year: 2015)
                        birthdayViewModel.decrementMonth()
                        expect(birthdayViewModel.month).to(equal(12))
                    }
                }

                context("month value is at upper limit") {
                    it("decrements month value") {
                        let birthdayViewModel = BirthdayViewModel(day: 1, month: 12, year: 2015)
                        birthdayViewModel.decrementMonth()
                        expect(birthdayViewModel.month).to(equal(11))
                    }
                }
            }
        }
    }
}
