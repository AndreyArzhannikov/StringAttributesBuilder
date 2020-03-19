//
//  NSAttributedString+Link.swift
//  StringAttributesBuilder
//
//  Created by Andrey Arzhannikov on 20.03.2020.
//  Copyright © 2020 Arzhannikov. All rights reserved.
//

import Foundation

public extension NSAttributedString {

     struct Link {
        let text: String
        let url: URL

        public init(text: String, url: URL) {
            self.text = text
            self.url = url
        }
    }

    func apply(links: [Link], builder: AttributesBuilder) -> NSAttributedString {
        apply(links: links, attributes: builder.attributes)
    }

    func apply(link: Link, builder: AttributesBuilder) -> NSAttributedString {
        apply(links: [link], attributes: builder.attributes)
    }

    func apply(links: [Link], attributes: StringAttributes = [:]) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(attributedString: self)
        let text = self.string as NSString
        let linkRanges = links.map { text.range(of: $0.text) }

        guard linkRanges.allSatisfy({ $0.length > 0 }) else { return self }

        zip(links, linkRanges).forEach { link, range in
            attributedString.addAttributes(attributes, range: range)
            attributedString.addAttribute(.link, value: link.url, range: range)
        }

        return attributedString
    }

    func apply(link: Link, attributes: StringAttributes = [:]) -> NSAttributedString {
        apply(links: [link], attributes: attributes)
    }

    func apply(attributes: StringAttributes, to substrings: [String]) -> NSAttributedString {
        let attributedText = mutableAttributed
        let text = string as NSString
        let substringRanges = substrings.map { text.range(of: $0) }

        guard substringRanges.allSatisfy({ $0.length > 0 }) else { return self }

        substringRanges.forEach { range in
            attributedText.addAttributes(attributes, range: range)
        }

        return attributedText
    }

    func apply(attributes: StringAttributes, to substring: String) -> NSAttributedString {
        apply(attributes: attributes, to: [substring])
    }

    var mutableAttributed: NSMutableAttributedString {
        NSMutableAttributedString(attributedString: self)
    }
}
