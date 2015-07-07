//
//  DataDownloader.swift
//  DevelopmentTest
//
//  Created by Petr Makarov on 07/07/15.
//  Copyright (c) 2015 Kentor. All rights reserved.
//

import UIKit

class DataDownloader
{
    static var activeLoaders:Int = 0 {
        didSet {
            if(activeLoaders == 1){
                self.onLoadingBegin()
            } else if(activeLoaders == 0) {
                self.onLoadingEnd()
            }
        }
    }
    
    static var onLoadingBegin:() -> () = {}
    
    static var onLoadingEnd:() -> () = {}
    
    class func jsonDownload(url:String, onComplete:(AnyObject) -> Void){
        activeLoaders++
        let getUrl = NSURL(string: url)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(getUrl!) {(data, response, error) in
            let jsonString = NSString(data: data, encoding: NSUTF8StringEncoding)
            let jsonData = jsonString?.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
            let jsonObject: AnyObject! = NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions(0), error: nil)
            
            dispatch_async(dispatch_get_main_queue()) {
                onComplete(jsonObject)
            }
            
            self.activeLoaders--
        }
        
        task.resume()
    }
    
    class func flagImageDownload(country:CountryData, onComplete:(CountryData) -> Void){
        activeLoaders++
        let getUrl = NSURL(string: country.flagUrl)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(getUrl!) {(data, response, error) in
            country.flagImage = UIImage(data: data)!
            
            dispatch_async(dispatch_get_main_queue()) {
                onComplete(country)
            }            
       
            self.activeLoaders--
        }
        
        task.resume()
    }
}

