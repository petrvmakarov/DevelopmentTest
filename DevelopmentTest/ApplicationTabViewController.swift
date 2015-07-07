//
//  ApplicationTabViewController.swift
//  DevelopmentTest
//
//  Created by Petr Makarov on 06/07/15.
//  Copyright (c) 2015 Kentor. All rights reserved.
//

import UIKit

class ApplicationTabViewController: UIViewController {
    
    @IBOutlet weak var loader: UIActivityIndicatorView?
    
    var model: CountryData? {
        get {
            return WorldData.getCurrentCountry()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.reloadView()
    }
    
    @IBAction func handleSwipe(sender:AnyObject) {
        
        let recognizer:UISwipeGestureRecognizer = sender as! UISwipeGestureRecognizer
        var transitionOptions:UIViewAnimationOptions = UIViewAnimationOptions.TransitionNone
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controllerToShow = storyboard.instantiateViewControllerWithIdentifier(self.restorationIdentifier!) as! UIViewController
        
        if(recognizer.direction == UISwipeGestureRecognizerDirection.Right) {
            transitionOptions = UIViewAnimationOptions.TransitionFlipFromRight
            WorldData.setNextCountry()
        } else if(recognizer.direction == UISwipeGestureRecognizerDirection.Left) {
            transitionOptions = UIViewAnimationOptions.TransitionFlipFromLeft
            WorldData.setPrevCountry()            
        }
        
        UIView.transitionWithView(self.view, duration: 0.5, options: transitionOptions , animations: { () -> Void in
            //Do nothing
            }, completion:{[unowned self](completed) -> Void in
                self.reloadView()
        })
    }
    
    func reloadView() {
        //Do nothing
    }
    
}