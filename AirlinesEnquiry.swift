//
//  AirlinesEnquiry.swift
//  Airline
//
//  Created by MacStudent on 2018-07-30.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation

class AirlinesEnquiry {
    
    var airlinesID : Int
    private var enquiryType : String
    private var enquiryTitle : String
    private var enquiryDesc : String
    private var enquiryDate : Date
    
    var AirlinesID : Int {
        get{ return self.airlinesID }
        set{ self.airlinesID = newValue }
        }
    var EnquiryType : String {
        get{ return self.enquiryType }
        set{ self.enquiryType = newValue }
    }
    var EnquiryTitle : String {
        get{ return self.enquiryTitle }
        set{ self.enquiryTitle = newValue }
    }
    var EnquiryDesc : String {
        get{ return self.enquiryDesc }
        set{ self.enquiryDesc = newValue }
    }
    var EnquiryDate : Date {
        get{ return self.enquiryDate }
        set{ self.enquiryDate = newValue }
    }
    
    //default initializer / constructor
    init(){
        self.airlinesID = 0
        self.enquiryType = ""
        self.enquiryTitle = ""
        self.enquiryDesc = ""
        self.enquiryDate = DateFormatter().date(from: "")!
    }
    
    func displayData() -> String{
        var returnData = ""
        returnData += "\t \(self.airlinesID ) ------ \(self.enquiryType ) ------ \(self.enquiryTitle ) ------ \(self.enquiryDesc ) ------ \(self.enquiryDate ??)"
        return returnData
    }
    
}
