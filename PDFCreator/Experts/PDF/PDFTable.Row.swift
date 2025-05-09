//
//  PDFTable.Row.swift
//  PDFCreator
//
//  Created by oopers.com on 2025/04/25.
//  Copyright © 2025 oopers.com. All rights reserved.
//

extension PDF.Table {
    
    class Row {
        
        var width: PDF.Dimension.Length
        var height: PDF.Dimension.Length

        public var cells: [Cell] = []
        
        init(
            width: PDF.Dimension.Length = .zero,
            height: PDF.Dimension.Length = .absolute(.point(0)),
            cells: [Cell] = []
        ) {
            self.width = width
            self.height = height
            self.cells = cells
        }
    }
}

extension PDF.Table.Row: PDF.Table.Cell {
}
