//
//  NSString+RSParser.swift
//  RSParser
//
//  Created by Maurice Parker on 6/9/19.
//  Copyright © 2019 Ranchero Software, LLC. All rights reserved.
//

import Foundation
import CryptoKit

extension NSString {
	
	@available(iOS 13.0, OSX 10.15, *)
	@objc public func insecureMD5Hash() -> NSString? {
		guard let d = data(using: String.Encoding.utf8.rawValue) else {
			return nil
		}
		let md5Digest = Insecure.MD5.hash(data: d)
		let md5hex = md5Digest.reduce("", { $0 + String(format: "%02x", $1)})
		let md5String = md5hex[md5hex.startIndex..<md5hex.index(md5hex.startIndex, offsetBy: 32)]
		return md5String as NSString?
	}
	
}
