//
//  WorldData.swift
//  DevelopmentTest
//
//  Created by Petr Makarov on 07/07/15.
//  Copyright (c) 2015 Kentor. All rights reserved.
//

import Foundation

class WorldData
{
    static var worldpopulation:[CountryData] = []
    static var currentIndex:Int = 0
    
    class func getCurrentCountry() -> CountryData? {
        var country:CountryData? = nil
        if(!self.worldpopulation.isEmpty){
            country = self.worldpopulation[self.currentIndex]
        }
        return country
    }
    
    class func setNextCountry() {
        if(self.currentIndex+1 < self.worldpopulation.count){
            self.currentIndex++
        } else {
            self.currentIndex=0
        }
    }
    
    class func setPrevCountry() {
        if(self.currentIndex-1 > 0){
            self.currentIndex--
        } else {
            self.currentIndex=self.worldpopulation.count-1
        }
    }
    
}
