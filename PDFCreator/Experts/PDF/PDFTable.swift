//
//  PDFTable.swift
//  PDFCreator
//
//  Created by oopers.com on 2025/04/25.
//  Copyright © 2025 oopers.com. All rights reserved.
//

import PDFKit

extension PDF {
    /*
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
     */
    public class Table: Stack {
        
        public override init(direction: PDF.Stack.Direction = .vertical, size: PDF.Dimension.Size) {
            super.init(direction: direction, size: size)
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

        /*
        public static
        func rowBased(size: PDF.Dimension.Size) -> Table {
            return Table(direction: .vertical, size: size)
        }
        
        public static
        func columnBased(size: PDF.Dimension.Size) -> Table {
            return Table(direction: .horizontal, size: size)
        }
         */
    }
}

/*
extension PDF.Table: PDF.Table.Cell {
    
}
*/
