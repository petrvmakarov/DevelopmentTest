//
//  JsonParser.swift
//  DevelopmentTest
//
//  Created by Petr Makarov on 07/07/15.
//  Copyright (c) 2015 Kentor. All rights reserved.
//

import Foundation

class JsonParser
{
    class func jsonToWorldData(json:AnyObject) -> [CountryData] {
        let worldpopulation = json as! Dictionary<String, AnyObject>
        let countries = (worldpopulation["worldpopulation"]! as! Array<AnyObject>)
        
        var data:[CountryData] = Array()
        
        for item in countries {
            let itemDic = item as! Dictionary<String, AnyObject>
            let country = CountryData()
            country.rank = (itemDic["rank"]! as! Int)
            country.name = (itemDic["country"]! as! String)
            country.population = (itemDic["population"]! as! String)
            country.flagUrl = (itemDic["flag"]! as! String)
            data.append(country)
        }
        
        return data
    }
    
}