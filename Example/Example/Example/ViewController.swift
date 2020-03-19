//
//  ViewController.swift
//  Example
//
//  Created by Andrey Arzhannikov on 20.03.2020.
//  Copyright © 2020 Arzhannikov. All rights reserved.
//

import UIKit
import StringAttributesBuilder

class ViewController: UIViewController {

    private let textView: UITextView = {
        let textView: UITextView = .init()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    private var appleSiteUrl: URL {
        URL(string: "https://www.apple.com/")! // swiftlint:disable:this force_unwrapping
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
        setLabelText()
    }

    private func setLayout() {
        view.addSubview(textView)
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        textView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    private func setLabelText() {
        // Instead of this

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineSpacing = 8
        paragraphStyle.minimumLineHeight = 8

        textView.attributedText = NSAttributedString(
            string: "Hello, Apple!",
            attributes: [
                .foregroundColor: UIColor.orange,
                .backgroundColor: UIColor.black,
                .paragraphStyle: paragraphStyle,
                .font: UIFont.systemFont(ofSize: 16)
                // Need to find range and add link here
                // so tedious...
        ])

        // Let's use String Attributes Builder with chaining syntax and type safety and have fun
        textView.attributedText = "Hello, Apple!".attributed(builder: AttributesBuilder()
            .foreground(color: .orange)
            .background(color: .black)
            .paragraphStyle(builder: ParagraphStyleBuilder()
                .alignment(.center)
                .lineSpacing(1)
                .minimumLineHeight(1)
            )
            .font(.systemFont(ofSize: 24))
        ).apply(
            link: .init(text: "Apple", url: appleSiteUrl),
            builder: AttributesBuilder()
                .underlined(style: .single)
        )
    }
}
