//
//  TrailingHeadAndTailSpaceFile.swift
//  StockPrice
//
//  Created by Xuemeng Gao on 4/10/22.
//

import Foundation

extension String {
    func trimmingLeadingAndTrailingSpaces(using characterSet: CharacterSet = .whitespacesAndNewlines) -> String {
        return trimmingCharacters(in: characterSet)
    }
}
