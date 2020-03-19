//
//  AttributesBuilder.swift
//  StringAttributesBuilder
//
//  Created by Andrey Arzhannikov on 20.03.2020.
//  Copyright © 2020 Arzhannikov. All rights reserved.
//

import UIKit

public typealias StringAttributes = [NSAttributedString.Key: Any]

public final class AttributesBuilder {

    public private(set) var attributes: StringAttributes = .init()

    public init() {}
}

public extension AttributesBuilder {

    func underlined(style: NSUnderlineStyle) -> AttributesBuilder {
        attributes[.underlineStyle] = NSUnderlineStyle.single.rawValue
        return self
    }

    func foreground(color: UIColor) -> AttributesBuilder {
        attributes[.foregroundColor] = color
        return self
    }

    func background(color: UIColor) -> AttributesBuilder {
        attributes[.backgroundColor] = color
        return self
    }

    func paragraphStyle(_ paragraphStyle: NSParagraphStyle) -> AttributesBuilder {
        attributes[.paragraphStyle] = paragraphStyle
        return self
    }

    func paragraphStyle(builder: ParagraphStyleBuilder) -> AttributesBuilder {
        attributes[.paragraphStyle] = builder.paragraphStyle
        return self
    }

    func font(_ font: UIFont) -> AttributesBuilder {
        attributes[.font] = font
        return self
    }

    func link(url: URL) -> AttributesBuilder {
        attributes[.link] = url
        return self
    }

    // ...
}
