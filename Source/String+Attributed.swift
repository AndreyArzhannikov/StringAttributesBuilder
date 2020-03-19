//
//  String+Attributed.swift
//  StringAttributesBuilder
//
//  Created by Andrey Arzhannikov on 20.03.2020.
//  Copyright © 2020 Arzhannikov. All rights reserved.
//

import UIKit

extension String {

    func attributed(with attributes: StringAttributes) -> NSAttributedString {
        return NSAttributedString(string: self, attributes: attributes)
    }

    func attributed(builder: AttributesBuilder) -> NSAttributedString {
        attributed(with: builder.attributes)
    }

    func mutableAttributed(with attributes: StringAttributes = [:]) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: self, attributes: attributes)
    }

    func mutableAttributed(builder: AttributesBuilder) -> NSMutableAttributedString {
        return mutableAttributed(with: builder.attributes)
    }
}
