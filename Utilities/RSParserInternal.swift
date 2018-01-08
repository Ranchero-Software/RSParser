//
//  RSParserInternal.swift
//  RSParser
//
//  Created by Daniel Jalkut on 1/8/18.
//  Copyright © 2018 Ranchero Software, LLC. All rights reserved.
//

import Foundation

extension NSDictionary {

	@objc (rsparser_objectForCaseInsensitiveKey:)
	open func object(forCaseInsensitiveKey searchKey: String) -> Any? {

		if let obj = self[searchKey] {
			return obj
		}

		for oneKey in self.allKeys {
			if oneKey is String && searchKey.caseInsensitiveCompare(searchKey) == ComparisonResult.orderedSame {
				return self[oneKey]
			}
		}

		return nil
	}

}
