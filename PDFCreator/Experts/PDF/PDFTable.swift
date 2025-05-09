//
//  PDFTable.swift
//  PDFCreator
//
//  Created by oopers.com on 2025/04/25.
//  Copyright © 2025 oopers.com. All rights reserved.
//

import PDFKit

extension PDF {
    
    class Table {
        
        var width: PDF.Dimension.Length
        var height: PDF.Dimension.Length
        
        init(width: PDF.Dimension.Length, height: PDF.Dimension.Length) {
            self.width = width
            self.height = height
        }
        
        func draw(in context: CGContext) {
            
        }
    }
}

extension PDF.Table: PDF.Table.Cell {
    
}
