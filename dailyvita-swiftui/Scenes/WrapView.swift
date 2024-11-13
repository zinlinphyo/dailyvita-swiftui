//
//  WrapView.swift
//  dailyvita-swiftui
//
//  Created by Zin Lin Phyo on 13/11/24.
//

import SwiftUI

struct WrapView<Item: Taggable>: View {
    let items: [Item]
    @Binding var selectedItems: [Item]
    let maxSelection: Int

    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 10)], spacing: 10) {
            ForEach(items) { item in
                Button(action: {
                    toggleSelection(item)
                }) {
                    Text(item.name)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(selectedItems.contains(item) ? Color.blue : Color.gray.opacity(0.2))
                        .foregroundColor(.white)
                        .cornerRadius(16)
                }
            }
        }
    }

    private func toggleSelection(_ item: Item) {
        if let index = selectedItems.firstIndex(of: item) {
            selectedItems.remove(at: index)
        } else if selectedItems.count < maxSelection {
            selectedItems.append(item)
        }
    }
}
