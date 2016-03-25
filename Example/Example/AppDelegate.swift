//
//  AppDelegate.swift
//  Example
//
//  Created by Kohei Tabata on 2016/03/25.
//  Copyright © 2016年 Kohei Tabata. All rights reserved.
//

import Cocoa
import NSPageControl

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    private var pageControl: NSPageControl!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        setupPageControl()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
    }

    //MARK: - private

    private func setupPageControl() {
        pageControl = NSPageControl()
        pageControl.numberOfPages = 4
        let width: CGFloat = 200
        let x: CGFloat = (window.frame.width - width) / 2
        pageControl.frame = CGRectMake(x, 20, 200, 20)
        window.contentView?.addSubview(pageControl)
    }

    //MARK: - IBAction

    @IBAction func tapPreviousButton(sender: NSButton) {
        pageControl.currentPage -= 1
    }

    @IBAction func tapNextButton(sender: NSButton) {
        pageControl.currentPage += 1
    }
}
