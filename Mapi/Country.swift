//
//  Country.swift
//  Mapi
//
//  Created by Mavi on 16/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import Foundation

class Country {
    
    private var _name: String
    private var _alphaCode: String
    
    //Getters
    var name: String {
        return _name
    }
    
    var alphaCode: String {
        return _alphaCode
    }
    
    init(name: String, alphaCode: String) {
        self._name = name
        self._alphaCode = alphaCode
    }
}
