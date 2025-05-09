//
//  PDFTextFlow.swift
//  PDFCreator
//
//  Created by oopers.com on 2025/04/28.
//  Copyright © 2025 oopers.com. All rights reserved.
//

import Foundation

extension PDF {
    
    class TextFlow {
        var source: PDF.TextSource
        var start: Int = 0
        var end: Int = 0
        
        init(source: PDF.TextSource) {
            self.source = source
        }
    }

    class TextSource {
        var text: String
        
        init(_ text: String) {
            self.text = text
        }
    }
}
