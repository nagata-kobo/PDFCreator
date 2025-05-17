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
            //verticalAlignment: .top,
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

        let weekRows = createWeekRows()
        for weekRow in weekRows {
            page.pageContent.add(weekRow)
        }

        return [page]
    }
    
    private
    let lineHeight: PDF.Dimension.Length = .absolute(.point(12))
    
    private func createWeekRows() -> [WeeklyReportTable] {
        let week1Row = WeeklyReportTable()
        return [week1Row]
    }
}

