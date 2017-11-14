//
// Created by Joshua Gretz on 11/1/15.
// Copyright (c) 2015 Truefit. All rights reserved.
//

import Foundation

class Tree {
    var type:String?
}

class Flower:NSObject,Cerealizable {
    @objc var type:String?
    @objc var color:String?
    @objc var planted:Date?
    @objc var petals:Array<Petal>?
    @objc var imageUrl: String?

    @objc func shouldSerializeProperty(_ propertyName: String) -> Bool  {
        return true
    }

    @objc func overrideSerializeProperty(_ propertyName: String) -> Bool {
        return false
    }

    @objc func serializeProperty(_ propertyName: String) -> AnyObject? {
        return nil
    }

    @objc func shouldDeserializeProperty(_ propertyName: String) -> Bool {
        return true
    }

    @objc func typeFor(_ propertyName: String, value: AnyObject?) -> AnyClass {
        if (propertyName == "petals") {
            return Petal.self
        }

        if (value != nil) {
            return Swift.type(of: value!)
        }

        return NSObject.self
    }

    @objc func overrideDeserializeProperty(_ propertyName: String, value: AnyObject?) -> Bool {
        return false
    }

    @objc func deserializeProperty(_ propertyName: String, value: AnyObject?) {
    }
}

class Petal:NSObject {
    @objc var color:String?

    @objc convenience init(color:String) {
        self.init()

        self.color = color
    }
}
