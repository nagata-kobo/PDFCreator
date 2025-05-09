//
//  PDFTable.Cell.swift
//  PDFCreator
//
//  Created by oopers.com on 2025/04/25.
//  Copyright © 2025 oopers.com. All rights reserved.
//

extension PDF.Table {
    
    protocol Cell {
        var width: PDF.Dimension.Length { get }
        var height: PDF.Dimension.Length { get }
    }
}
