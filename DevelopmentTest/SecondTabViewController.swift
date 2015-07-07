//
//  SecondTabViewController.swift
//  DevelopmentTest
//
//  Created by Petr Makarov on 06/07/15.
//  Copyright (c) 2015 Kentor. All rights reserved.
//

import UIKit

class SecondTabViewController: ApplicationTabViewController {
    
    @IBOutlet weak var population: UILabel?
    
    override func reloadView() {
        self.population?.hidden = self.model == nil
        self.loader?.hidden = self.model != nil
        if(self.model != nil) {
            self.population!.text =  self.model?.population
        }
    }
    
    @IBAction func handleGoBackToCountryButton(sender:AnyObject) {
        (self.parentViewController as! UITabBarController).selectedIndex = 0
    }
    
}