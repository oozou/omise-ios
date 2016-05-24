import Foundation

public class OmiseJsonParser: NSObject {
    public func parseOmiseToken(data: NSData) throws -> OmiseToken {
        guard let jsonObject = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) else {
            throw OmiseError.Unexpected("Error response deserialization failure")
        }
        
        guard let jsonDict = jsonObject as? NSDictionary else {
            throw OmiseError.Unexpected("Error response object is not dictionary data")
        }
        
        guard jsonDict["object"] as? String == "token" else {
            throw OmiseError.Unexpected("Error this object is not token object")
        }
        
        let token = OmiseToken()
        token.tokenId = jsonDict["id"] as? String
        token.livemode = jsonDict["livemode"] as? Bool
        token.location = jsonDict["location"] as? String
        token.used = jsonDict["used"] as? Bool
        token.created = DateConverter.convertFromString(jsonDict["created"] as? String)
        
        guard let cardDict = jsonDict["card"] as? NSDictionary else {
            throw OmiseError.Unexpected("Error card object is not dictionary data")
        }
        
        guard let card = token.card else {
            throw OmiseError.Unexpected("Error card object is empty")
        }
        
        card.cardId = cardDict["id"] as? String
        card.livemode = cardDict["livemode"] as? Bool
        card.location = cardDict["location"] as? String
        card.country = cardDict["country"] as? String
        card.city = cardDict["city"] as? String
        card.postalCode = cardDict["postal_code"] as? String
        card.financing = cardDict["financing"] as? String
        card.lastDigits = cardDict["last_digits"] as? String
        card.brand = cardDict["brand"] as? String
        card.expirationMonth = cardDict["expiration_month"] as? Int
        card.expirationYear = cardDict["expiration_year"] as? Int
        card.fingerprint = cardDict["fingerprint"] as? String
        card.name = cardDict["name"] as? String
        card.securityCodeCheck = cardDict["security_code_check"] as? Bool
        card.created = DateConverter.convertFromString(cardDict.objectForKey("created") as? String)
        
        return token
    }
    
    public func parseOmiseError(data: NSData) throws -> OmiseError {
        guard let jsonObject = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) else {
            throw OmiseError.Unexpected("Error response deserialization failure")
        }
        
        guard let jsonDict = jsonObject as? NSDictionary else {
            throw OmiseError.Unexpected("Error response object is not dictionary data")
        }
        
        guard jsonDict["object"] as? String == "error" else {
            throw OmiseError.Unexpected("Error this object is not error object")
        }
        
        let error = OmiseError()
        error.location = jsonDict["location"] as? String
        error.code = jsonDict["code"] as? String
        error.message = jsonDict["message"] as? String
        
        return error
    }
}