//
//  PDFTable.Row.swift
//  PDFCreator
//
//  Created by oopers.com on 2025/04/25.
//  Copyright © 2025 oopers.com. All rights reserved.
//

import UIKit

extension PDF.Table {
    /*
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
     */
    public
    class Row: PDF.Table/*PDF.Stack*/ {
        
        public
        init(
            size: PDF.Dimension.Size
        ) {
            super.init(direction: .horizontal, size: size)
        }
        
        /*
        public override
        func draw(into context: UIGraphicsPDFRendererContext, in environment: PDF.Environment) {
            super.draw(into: context, in: environment)
            for layout in contentLayouts {
                let container = layout.container
                guard let bounds = container.bounds else {continue}
                context.stroke(bounds)
            }
        }
         */
    }
    
    public
    class Column: PDF.Table/*PDF.Stack*/ {
        
        public
        init(
            size: PDF.Dimension.Size
        ) {
            super.init(direction: .vertical, size: size)
        }
        
        /*
        public override
        func draw(into context: UIGraphicsPDFRendererContext, in environment: PDF.Environment) {
            super.draw(into: context, in: environment)
            for layout in contentLayouts {
                let container = layout.container
                guard let bounds = container.bounds else {continue}
                context.stroke(bounds)
            }
        }
         */
    }
}

/*
extension PDF.Table.Row: PDF.Table.Cell {
}
 */
