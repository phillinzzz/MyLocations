//
//  String+AddText.swift
//  MyLocations
//
//  Created by 戴林 on 11/29/18.
//  Copyright © 2018 potatosoft.co.ltd. All rights reserved.
//

extension String {
    mutating func add(text: String?, separatedBy separator: String = "") {
        if let text = text {
            if !isEmpty {
                self += separator
            }
            self += text
        }
    }
}
