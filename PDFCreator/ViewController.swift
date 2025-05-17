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
        let page = PDF.Page(
            size: .a4portrait,
            leftPadding: .absolute(.millimeter(10)),
            rightPadding: .absolute(.millimeter(10)),
            topPadding: .absolute(.millimeter(10)),
            bottomPadding: .absolute(.millimeter(10))
        )
        let textSize = PDF.Dimension.Size(
            width: .relative(1.0),
            height: .absolute(.point(100/*26*/))
        )
        let font = UIFont.systemFont(ofSize: 20)
        let textFormat = NSLocalizedString("血圧レポート (年/月/日-年/月/日)", comment: "")
        page.pageContent.add(PDF.TextContainer(
            textFormat,
            font: font,
            alignment: .center,
            //verticalAlignment: .bottom,
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
        /*
        let lineHeigt: PDF.Dimension.Length = .absolute(.point(12))
        let weeksSize = PDF.Dimension.Size(
            width: .relative(1.0),
            height: lineHeigt * 7 * 2 * 2
        )
        let weeksRow = PDF.Table.Row(size: weeksSize)
        page.pageContent.add(weeksRow)
         */
        let weekRows = createWeekRows()
        for weekRow in weekRows {
            page.pageContent.add(weekRow)
        }
        let col1Size = PDF.Dimension.Size(
            width: .relative(0.62),
            height: .relative(1.0)
        )
        let col1 = PDF.Table.Column(size: col1Size)
        /*
        let col1 = PDF.TextContainer("2025-04-19 07:48:00", size: col1Size)
        col1.font = UIFont.boldSystemFont(ofSize: 5)
        col1.alignment = .center
        row.add(col1)
        let col2Size = PDF.Dimension.Size(
            width: .relative(0.03),
            height: .relative(1.0)
        )
        let col2 = PDF.TextContainer("☀️", size: col2Size)
        col2.font = UIFont.boldSystemFont(ofSize: 5)
        col2.alignment = .center
        row.add(col2)
        let col3Size = PDF.Dimension.Size(
            width: .relative(0.1),
            height: .relative(1.0)
        )
        let col3 = PDF.TextContainer("125", size: col3Size)
        col3.font = UIFont.boldSystemFont(ofSize: 5)
        col3.alignment = .center
        row.add(col3)
        let col4Size = PDF.Dimension.Size(
            width: .relative(0.1),
            height: .relative(1.0)
        )
        let col4 = PDF.TextContainer("75", size: col4Size)
        col4.font = UIFont.boldSystemFont(ofSize: 5)
        col4.alignment = .center
        row.add(col2)
        let col2Size = PDF.Dimension.Size(
            width: .relative(0.03),
            height: .relative(1.0)
        )
        let col2 = PDF.TextContainer("☀️", size: col2Size)
        col2.font = UIFont.boldSystemFont(ofSize: 5)
        col2.alignment = .center
        row.add(col2)
         */
        let col3Size = PDF.Dimension.Size(
            width: .relative(0.7),
            height: .relative(1.0)
        )
        let col3 = PDF.Table.Column(size: col3Size)
        let subrow3Size = PDF.Dimension.Size(
            width: .relative(1.0),
            height: .relative(0.5)
        )
        let subrow31 = PDF.Table.Row(size: subrow3Size)
        let subcol3x1Size = PDF.Dimension.Size(
            width: .relative(3.0/7.0),
            height: .relative(1.0)
        )
        let subcol3x2Size = PDF.Dimension.Size(
            width: .relative(4.0/7.0),
            height: .relative(1.0)
        )
        let subcol3x1 = PDF.Table.Column(size: subcol3x1Size)
        subrow31.add(subcol3x1)
        col3.add(subrow31)
        let subrow32 = PDF.Table.Row(size: subrow3Size)
        col3.add(subrow32)
        /*
        row.add(col3)
        page.pageContent.add(row)
         */
        return [page]
    }
    
    private
    let lineHeight: PDF.Dimension.Length = .absolute(.point(12))
    
    private func createWeekRows() -> [WeeklyReportTable] {
        let week1Row = WeeklyReportTable()
        return [week1Row]
    }
}

