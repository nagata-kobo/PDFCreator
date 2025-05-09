//
//  PDFStack.swift
//  PDFCreator
//
//  Created by oopers.com on 2025/05/08.
//  Copyright © 2025 oopers.com. All rights reserved.
//

import UIKit

extension PDF {
    
    class Stack: Container {
        
        enum Direction {
            case vertical
            case horizontal
        }
        
        var direction: Direction = .vertical
        
        var contentLayouts: [PDF.Container.Layout] = []
        
        init(
            direction: Direction = .vertical,
            size: Dimension.Size
        ) {
            self.direction = direction
            super.init(size: size)
        }
        
        func add(
            _ content: PDF.Container,
            fromEnd: Bool = false
        ) {
            content.parent = self
            let anchors: PDF.Container.Anchors
            switch direction {
            case .vertical:
                if fromEnd {
                    anchors = [.bottom, .leading, .trailing]
                } else {
                    anchors = [.top, .leading, .trailing]
                }
            case .horizontal:
                if fromEnd {
                    anchors = [.trailing, .top, .bottom]
                } else {
                    anchors = [.leading, .top, .bottom]
                }
            }
            let layout = Layout(
                container: content,
                anchors: anchors
            )
            contentLayouts.append(layout)
        }
        
        public override
        func draw(
            into context: UIGraphicsPDFRendererContext,
            in environment: PDF.Environment
        ) {
            fixContentBounds(in: environment)
            guard let contentBounds else {return}
            print("***", contentBounds)
            //TODO:
            for layout in contentLayouts {
                let content = layout.container
                environment.push(content)
                content.draw(into: context, in: environment)
                environment.pop()
            }
        }
        
        public override
        func fixContentBounds(in environment: PDF.Environment) {
            super.fixContentBounds(in: environment)
            guard let contentBounds else {return}
            var remainingBounds = contentBounds
            switch direction {
            case .vertical:
                for layout in contentLayouts {
                    guard layout.anchors.contains(.leading),
                          layout.anchors.contains(.trailing)
                    else {continue}
                    var height = layout.container.size.height.heightValue(for: contentBounds.size, dpi: environment.dpi)
                    guard !height.isNaN else {continue}
                    if height > remainingBounds.height {
                        height = remainingBounds.height
                    }
                    let width = remainingBounds.width
                    let size = CGSize(width: width, height: height)
                    if layout.anchors.contains(.top) {
                        let origin = remainingBounds.origin
                        layout.container.bounds = CGRect(origin: origin, size: size)
                        remainingBounds.origin.y += height
                        remainingBounds.size.height -= height
                    } else if layout.anchors.contains(.bottom) {
                        let x = remainingBounds.origin.x
                        let y = remainingBounds.origin.y + remainingBounds.size.height - height
                        let origin = CGPoint(x: x, y: y)
                        layout.container.bounds = CGRect(origin: origin, size: size)
                        remainingBounds.size.height -= height
                    } else {
                        continue
                    }
                }
            case .horizontal:
                for layout in contentLayouts {
                    guard layout.anchors.contains(.top),
                          layout.anchors.contains(.bottom)
                    else {continue}
                    var width = layout.container.size.width.widthValue(for: contentBounds.size, dpi: environment.dpi)
                    guard !width.isNaN else {continue}
                    if width > contentBounds.width {
                        width = contentBounds.width
                    }
                    let height = remainingBounds.height
                    let size = CGSize(width: width, height: height)
                    if layout.anchors.contains(environment.leftAnchor) {
                        let origin = remainingBounds.origin
                        layout.container.bounds = CGRect(origin: origin, size: size)
                        remainingBounds.origin.x += width
                        remainingBounds.size.width -= width
                    } else if layout.anchors.contains(environment.rightAnchor) {
                        let x = remainingBounds.origin.x + remainingBounds.width - width
                        let y = remainingBounds.origin.y
                        let origin = CGPoint(x: x, y: y)
                        layout.container.bounds = CGRect(origin: origin, size: size)
                        remainingBounds.size.width -= width
                    } else {
                        continue
                    }
                }
            }
        }
    }
}
