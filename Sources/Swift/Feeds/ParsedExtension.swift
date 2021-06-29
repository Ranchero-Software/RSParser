//
//  ParsedExtension.swift
//  
//
//  Created by Jaanus Kase on 07.03.2021.
//

import Foundation

/// JSON Feed extension.
public struct ParsedExtension: Hashable {
    
    /// Name of extension, beginning with “_” according to JSON Feed spec. RSParser doesn’t transform the name in any way.
    public let name: String
    
    /*
     JSON Feed spec isn’t exhaustive about what types of values an extension can contain.
     We keep this ambiguity in implementation, only requiring values to be hashable,
     so that these values can be stored in sets.
     
     Public access to content values happens through subscript.
     */
    private let content: Dictionary<String, AnyHashable>
    
    public init(name: String, content: Dictionary<String, AnyHashable>) {
        self.name = name
        self.content = content
    }
    
    /// Access content items directly with subscript.
    public subscript(s: String) -> AnyHashable? {
        return self.content[s]
    }
    
}

extension Set where Element == ParsedExtension {
    
    /// Access individual extensions by name.
    public subscript(s: String) -> ParsedExtension? {
        return first { $0.name == s }
    }
}
