//
//  NSPageControlTests.swift
//  NSPageControlTests
//
//  Created by Kohei Tabata on 2016/03/25.
//  Copyright © 2016年 Kohei Tabata. All rights reserved.
//

import NSPageControl
import XCTest

class NSPageControlTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testToSetValidCurrentPage() {
        let pageControl: NSPageControl = NSPageControl(frame: NSRect.init(x: 0, y: 0, width: 100, height: 10))
        pageControl.numberOfPages = 3
        pageControl.drawRect(pageControl.frame)
        XCTAssertTrue(pageControl.currentPage == 0)
        pageControl.currentPage = 1
        XCTAssertTrue(pageControl.currentPage == 1)
        pageControl.currentPage = 2
        XCTAssertTrue(pageControl.currentPage == 2)
    }

    func testToSetInvalidCurrentPage() {
        let pageControl: NSPageControl = NSPageControl(frame: NSRect.init(x: 0, y: 0, width: 100, height: 10))
        pageControl.numberOfPages = 3
        pageControl.drawRect(pageControl.frame)
        XCTAssertTrue(pageControl.currentPage == 0)
        pageControl.currentPage = 3
        XCTAssertTrue(pageControl.currentPage == 2)
        pageControl.currentPage = -1
        XCTAssertTrue(pageControl.currentPage == 0)
    }
}
