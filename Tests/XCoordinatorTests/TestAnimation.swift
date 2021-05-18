//
//  TestAnimation.swift
//  XCoordinator_Tests
//
//  Created by Paul Kraft on 16.09.18.
//  Copyright © 2018 QuickBird Studios. All rights reserved.
//

import XCoordinator
import XCTest

class TestAnimation: Animation {

    static func `static`(presentation: XCTestExpectation, dismissal: XCTestExpectation) -> TestAnimation {
        TestAnimation(
            presentation: TestAnimation.staticTransitionAnimation(for: presentation),
            dismissal: TestAnimation.staticTransitionAnimation(for: dismissal)
        )
    }

    static func interactive(presentation: XCTestExpectation, dismissal: XCTestExpectation) -> TestAnimation {
        TestAnimation(
            presentation: TestAnimation.interactiveTransitionAnimation(for: presentation),
            dismissal: TestAnimation.interactiveTransitionAnimation(for: dismissal)
        )
    }

    private static func interactiveTransitionAnimation(for expectation: XCTestExpectation?) -> TransitionAnimation {
        InteractiveTransitionAnimation(duration: 0.1) {
            expectation?.fulfill()
            $0.completeTransition(true)
        }
    }

    private static func staticTransitionAnimation(for expectation: XCTestExpectation?) -> TransitionAnimation {
        StaticTransitionAnimation(duration: 0.1) {
            expectation?.fulfill()
            $0.completeTransition(true)
        }
    }

}
