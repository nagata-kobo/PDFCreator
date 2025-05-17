//
//  WeeklyReportTable.swift
//  PDFCreator
//
//  Created by oopers.com on 2025/05/14.
//  Copyright © 2025 oopers.com. All rights reserved.
//

import Foundation

private
let lineHeight: PDF.Dimension.Length = .absolute(.point(12))

class WeeklyReportTable: PDF.Table {
    
    static func createWeeklyReportTables() -> [PDF.Table] {
        return []
    }
    
    init() {
        let weeklyReportTableSize = PDF.Dimension.Size(
            width: .relative(1.0),
            height: lineHeight * 7 * 2 * 2
        )
        super.init(
            direction: .horizontal,
            size: weeklyReportTableSize
        )
        
        fillTableContens()
    }
    
    private func fillTableContens() {
        let weekWeightSize: PDF.Dimension.Size = .init(
            width: .absolute(.point(36)),
            height: lineHeight * 7 * 2 * 2
        )
        let weekWeight = PDF.TextContainer("84.0", size: weekWeightSize)
        weekWeight.font = .systemFont(ofSize: 9)
        weekWeight.alignment = .center
        self.add(weekWeight, fromEnd: true)
        let weekAverageColumnSize: PDF.Dimension.Size = .init(
            width: .absolute(.point(45)),
            height: lineHeight * 7 * 2 * 2
        )
        let diastolicValues = """
        82.0
        
        85.3
        78.7
        """
        let averageDiastolic = PDF.TextContainer(diastolicValues, size: weekAverageColumnSize)
        averageDiastolic.font = .systemFont(ofSize: 9)
        averageDiastolic.alignment = .center
        self.add(averageDiastolic, fromEnd: true)
        let systolicValues = """
        127.0
        
        132.7
        121.3
        """
        let averageSystolic = PDF.TextContainer(systolicValues, size: weekAverageColumnSize)
        averageSystolic.font = .systemFont(ofSize: 9)
        averageSystolic.alignment = .center
        self.add(averageSystolic, fromEnd: true)
        let dailyStatColumn = createDailyStatColumn()
        self.fill(dailyStatColumn)
    }
    
    private func createDailyStatColumn() -> PDF.Table.Column {
        let dailyStatColumnSize: PDF.Dimension.Size = .init(
            width: .flexible,
            height: .relative(1.0)
        )
        let dailyStatColumn = PDF.Table.Column(size: dailyStatColumnSize)
        for _ in 0..<7 {
            let dailyRow = createDailyRow()
            dailyStatColumn.add(dailyRow)
        }
        return dailyStatColumn
    }
    
    private func createDailyRow() -> PDF.Table.Row {
        let dailyRowSize: PDF.Dimension.Size = .init(
            width: .relative(1.0),
            height: lineHeight * 4
        )
        let dailyRow = PDF.Table.Row(size: dailyRowSize)
        let weightSize = PDF.Dimension.Size(
            width: .absolute(.point(36)),
            height: lineHeight * 4
        )
        let weight = PDF.TextContainer("84.5", size: weightSize)
        weight.font = .systemFont(ofSize: 9)
        weight.alignment = .center
        dailyRow.add(weight, fromEnd: true)
        let dailyStatsSize: PDF.Dimension.Size = .init(
            width: .flexible,
            height: lineHeight * 4
        )
        let dailyStats = PDF.Table.Column(size: dailyStatsSize)
        let dayRow = createDayOrNightRow()
        dailyStats.add(dayRow)
        let nightRow = createDayOrNightRow()
        dailyStats.add(nightRow)
        dailyRow.fill(dailyStats)
        return dailyRow
    }
    
    private func createDayOrNightRow() -> PDF.Table.Row {
        let dayOrNightRowSize: PDF.Dimension.Size = .init(
            width: .relative(1.0),
            height: lineHeight * 2
        )
        let dayOrNightRow = PDF.Table.Row(size: dayOrNightRowSize)
        let dayOrNightAverageSize: PDF.Dimension.Size = .init(
            width: .absolute(.point(45)),
            height: lineHeight * 2
        )
        let diastolicAverage = PDF.TextContainer("99.5", size: dayOrNightAverageSize)
        diastolicAverage.font = .systemFont(ofSize: 9)
        diastolicAverage.alignment = .center
        dayOrNightRow.add(diastolicAverage, fromEnd: true)
        let systolicAverage = PDF.TextContainer("999.0", size: dayOrNightAverageSize)
        systolicAverage.font = .systemFont(ofSize: 9)
        systolicAverage.alignment = .center
        dayOrNightRow.add(systolicAverage, fromEnd: true)
        let dayOrNightStatSize: PDF.Dimension.Size = .init(
            width: .flexible,
            height: lineHeight * 2
        )
        let dayOrNightStat = PDF.Table.Column(size: dayOrNightStatSize)
        dayOrNightRow.fill(dayOrNightStat)
        let sampleRow1 = createSampleRow()
        dayOrNightStat.add(sampleRow1)
        let sampleRow2 = createSampleRow()
        dayOrNightStat.add(sampleRow2)
        return dayOrNightRow
    }
    
    private func createSampleRow() -> PDF.Table.Row {
        let sampleRowSize: PDF.Dimension.Size = .init(
            width: .relative(1.0),
            height: lineHeight
        )
        let sampleRow = PDF.Table.Row(size: sampleRowSize)
        //Date
        let dateSize = PDF.Dimension.Size(width: .absolute(.point(108)), height: lineHeight)
        let dateColumn = PDF.TextContainer("9999-99-99 99:99:99", size: dateSize)
        dateColumn.font = .systemFont(ofSize: 9)
        dateColumn.alignment = .center
        sampleRow.add(dateColumn)
        //Day or Night
        let dayOrNightMarkerSize = PDF.Dimension.Size(width: .absolute(.point(18)), height: lineHeight)
        let dayOrNightMarker = PDF.TextContainer("☀️", size: dayOrNightMarkerSize)
        dayOrNightMarker.font = .systemFont(ofSize: 9)
        dayOrNightMarker.alignment = .center
        sampleRow.add(dayOrNightMarker)
        //Systolic
        let systolicValueSize = PDF.Dimension.Size(width: .absolute(.point(27)), height: lineHeight)
        let systolicValue = PDF.TextContainer("999", size: systolicValueSize)
        systolicValue.font = .systemFont(ofSize: 9)
        systolicValue.alignment = .center
        sampleRow.add(systolicValue)
        //Diastolic
        let diastolicValueSize = PDF.Dimension.Size(width: .absolute(.point(27)), height: lineHeight)
        let diastolicValue = PDF.TextContainer("99", size: diastolicValueSize)
        diastolicValue.font = .systemFont(ofSize: 9)
        diastolicValue.alignment = .center
        sampleRow.add(diastolicValue)
        //Heart rate
        let heartRateValueSize = PDF.Dimension.Size(width: .absolute(.point(27)), height: lineHeight)
        let heartRateValue = PDF.TextContainer("99", size: heartRateValueSize)
        heartRateValue.font = .systemFont(ofSize: 9)
        heartRateValue.alignment = .center
        sampleRow.add(heartRateValue)
        //Comment
        let commentSize = PDF.Dimension.Size(width: .flexible, height: lineHeight)
        let comment = PDF.TextContainer("**", size: commentSize)
        comment.leftPadding = .absolute(.point(5))
        comment.rightPadding = .absolute(.point(5))
        comment.font = .systemFont(ofSize: 9)
        comment.alignment = .left
        sampleRow.fill(comment)
        return sampleRow
    }
}
