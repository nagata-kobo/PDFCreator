//
//  PDFExpert.swift
//  PDFCreator
//
//  Created by oopers.com on 2025/04/25.
//  Copyright © 2025 oopers.com. All rights reserved.
//

extension PDF {
    actor Expert {
        var pages: [PDF.Page] = []
    }
}

extension PDF.Expert {
    public static let shared = PDF.Expert()
}
