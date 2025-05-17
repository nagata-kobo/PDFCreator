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
        
        public
        func add(
            _ content: PDF.Container,
            fromEnd: Bool = false
        ) {
            super.add(content, borders: .all, fromEnd: fromEnd)
        }
        
        public
        func fill(
            _ content: PDF.Container
        ) {
            super.fill(content, borders: .all)
        }
    }
}

/*
extension PDF.Table: PDF.Table.Cell {
    
}
*/
