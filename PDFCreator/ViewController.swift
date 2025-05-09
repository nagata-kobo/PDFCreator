//
//  ViewController.swift
//  PDFCreator
//
//  Created by oopers.com on 2025/04/25.
//  
//

import UIKit
import PDFKit

class ViewController: UIViewController {
    
    private var pdfView: PDFView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let pdfView = PDFView()

        pdfView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(pdfView, at: 0)
        pdfView.autoScales = true

        pdfView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        pdfView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        pdfView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        pdfView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.pdfView = pdfView
    }

    @IBAction func createPDFTapped(_ sender: UIButton) {
        let pdfEnv = PDF.Environment(pageSize: .a4portrait)
        let pages: [PDF.Page] = createPDFPages()
        let pdf = pdfEnv.createPDFData(for: pages)
        if let document = PDFDocument(data: pdf) {
            self.pdfView.document = document
        }
    }
    
    private func createPDFPages() -> [PDF.Page] {
        let page = PDF.Page.a4portrait
        let textSize = PDF.Dimension.Size(
            width: .relative(1.0),
            height: .absolute(.point(26))
        )
        let font = UIFont.systemFont(ofSize: 20)
        let textFormat = NSLocalizedString("血圧レポート (年/月/日-年/月/日)", comment: "")
        page.pageContent.add(PDF.TextContainer(
            textFormat,
            font: font,
            alignment: .center,
            size: textSize))
        let footerSize = PDF.Dimension.Size(
            width: .relative(1.0),
            height: .absolute(.point(26))
        )
        let footerFont = UIFont.systemFont(ofSize: 20)
        let footerFormat = NSLocalizedString("ページ番号/ページ数", comment: "")
        page.pageContent.add(
            PDF.TextContainer(
                footerFormat,
                font: footerFont,
                alignment: .center,
                size: footerSize
            ),
            fromEnd: true
        )
        let rowSize = PDF.Dimension.Size(
            width: .relative(1.0),
            height: .absolute(.point(26))
        )
        let row = PDF.Table.Row(size: rowSize)
        let col1Size = PDF.Dimension.Size(
            width: .relative(0.1),
            height: .relative(1.0)
        )
        let col1 = PDF.Table.Column(size: col1Size)
        row.add(col1)
        let col2Size = PDF.Dimension.Size(
            width: .relative(0.2),
            height: .relative(1.0)
        )
        let col2 = PDF.Table.Column(size: col2Size)
        row.add(col2)
        let col3Size = PDF.Dimension.Size(
            width: .relative(0.3),
            height: .relative(1.0)
        )
        let col3 = PDF.Table.Column(size: col3Size)
        row.add(col3)
        let col4Size = PDF.Dimension.Size(
            width: .relative(0.4),
            height: .relative(1.0)
        )
        let col4 = PDF.Table.Column(size: col4Size)
        row.add(col4)
        page.pageContent.add(row)
        return [page]
    }
}

