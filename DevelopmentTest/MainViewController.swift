//
//  ViewController.swift
//  DevelopmentTest
//
//  Created by Petr Makarov on 06/07/15.
//  Copyright (c) 2015 Kentor. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        if(WorldData.worldpopulation.isEmpty){
            DataDownloader.jsonDownload("http://www.androidbegin.com/tutorial/jsonparsetutorial.txt", onComplete: {[unowned self](d) in
                WorldData.worldpopulation = JsonParser.jsonToWorldData(d)
                (self.selectedViewController as! ApplicationTabViewController).reloadView()                
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

