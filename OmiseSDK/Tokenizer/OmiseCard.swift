//
//  OmiseCard.swift
//  OmiseSDK
//
//  Created by Anak Mirasing on 5/11/16.
//  Copyright © 2016 Omise. All rights reserved.
//

public class OmiseCard {
    
    public var cardId: String?
    public var livemode: Bool?
    public var location: String?
    public var country: String?
    public var financing: String?
    public var lastDigits: String?
    public var brand: String?
    public var fingerprint: String?
    public var securityCodeCheck: Bool?
    public var created: String?
    
    // For create a token
    public var name: String?
    public var number: String?
    public var expirationMonth: Int?
    public var expirationYear: Int?
    public var securityCode: String?
    public var city: String?           // Optional
    public var postalCode: String?     // Optional
}
