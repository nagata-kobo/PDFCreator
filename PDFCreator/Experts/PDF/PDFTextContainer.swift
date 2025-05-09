//
//  PDFTextContainer.swift
//  PDFCreator
//
//  Created by oopers.com on 2025/04/30.
//  Copyright © 2025 oopers.com. All rights reserved.
//

import UIKit

extension PDF {
    
    public class TextContainer: Container {
        /*
        var textFlow = PDF.TextFlow(source: .init(""))
         */
        
        private var text: String?
        
        private var font: UIFont?
        
        private var alignment: NSTextAlignment?
        
        public init(
            _ text: String,
            size: PDF.Dimension.Size = .zero
        ) {
            self.text = text
            super.init(size: size)
        }
        
        public init(
            _ text: String,
            font: UIFont,
            alignment: NSTextAlignment?,
            size: PDF.Dimension.Size = .zero
        ) {
            self.text = text
            self.font = font
            self.alignment = alignment
            super.init(size: size)
        }
        
        public override func draw(
            into context: UIGraphicsPDFRendererContext,
            in environment: PDF.Environment
        ) {
            fixContentBounds(in: environment)
            guard let contentBounds else {return}
            print("***", contentBounds)
            let font = self.font ?? UIFont.systemFont(ofSize: 150)
            let attributes: [NSAttributedString.Key : Any] = [
                .font: font,
                .paragraphStyle: createParagraphStyle(),
            ]
            let nsText = (text ?? "") as NSString
            nsText.draw(in: contentBounds, withAttributes: attributes)
            //For debugging
            context.stroke(contentBounds)
        }
        
        private func createParagraphStyle() -> NSParagraphStyle {
            let alignment = self.alignment ?? .natural
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineBreakMode = .byTruncatingTail
            paragraphStyle.alignment = alignment
            return paragraphStyle
        }
    }
}
