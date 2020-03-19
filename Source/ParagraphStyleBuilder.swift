//
//  ParagraphStyleBuilder.swift
//  StringAttributesBuilder
//
//  Created by Andrey Arzhannikov on 20.03.2020.
//  Copyright © 2020 Arzhannikov. All rights reserved.
//

import UIKit

public final class ParagraphStyleBuilder {

    public var paragraphStyle: NSParagraphStyle {
        mutableParagraphStyle
    }

    private var mutableParagraphStyle: NSMutableParagraphStyle = .init()

    public init() {}
}

public extension ParagraphStyleBuilder {

    func alignment(_ alignment: NSTextAlignment) -> ParagraphStyleBuilder {
        mutableParagraphStyle.alignment = alignment
        return self
    }

    func minimumLineHeight(_ height: CGFloat) -> ParagraphStyleBuilder {
        mutableParagraphStyle.minimumLineHeight = height
        return self
    }

    func lineSpacing(_ spacing: CGFloat) -> ParagraphStyleBuilder {
        mutableParagraphStyle.lineSpacing = spacing
        return self
    }
    // ...
}
