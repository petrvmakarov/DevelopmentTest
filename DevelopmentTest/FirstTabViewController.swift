//
//  FirstTabViewController.swift
//  DevelopmentTest
//
//  Created by Petr Makarov on 06/07/15.
//  Copyright (c) 2015 Kentor. All rights reserved.
//

import UIKit

class FirstTabViewController: ApplicationTabViewController {   
    
    @IBOutlet weak var country: UILabel?
    @IBOutlet weak var flag: UIImageView?
    
    override func viewDidLoad() {        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func reloadView() {
        self.country?.hidden = self.model == nil
        self.loader?.hidden = self.model != nil
        
        if(self.model != nil) {
            self.country?.text =  self.model!.name
            
            self.flag?.hidden = self.model!.flagImage == nil
            self.loader?.hidden = self.model!.flagImage != nil
            
            if(self.model!.flagImage != nil){
                self.flag?.image = self.model!.flagImage                
            } else {
                self.loader?.hidden = false
                DataDownloader.flagImageDownload(self.model!, onComplete: {[unowned self](c) in
                    if(self.model!.rank == c.rank){
                        self.loader?.hidden = true
                        self.flag?.hidden = false
                        self.flag?.image = c.flagImage
                    }
                })
            }
        }       
        
    }
    
}
