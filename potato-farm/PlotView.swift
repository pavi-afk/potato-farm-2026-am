//
//  PlotView.swift
//  potato-farm
//
//  Draws a single square of the grid: either a planted potato or an empty plot.
//

import SwiftUI

struct PlotView: View {
    let plot: Int
    let potato: Potato?

    var body: some View {
        ZStack {
            if let potato {
                Circle()
                    .fill(potato.color.gradient)
                    .shadow(color: .black.opacity(0.15), radius: 2, y: 1)

                Text(potato.name)
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.4), radius: 1)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                    .padding(6)
            } else {
                Circle()
                    .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [4]))
                    .foregroundStyle(.secondary.opacity(0.4))

                Text("\(plot)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    HStack {
        PlotView(plot: 1, potato: Potato(plot: 1, name: "YJ", color: .brown))
        PlotView(plot: 2, potato: nil)
    }
    .padding()
}
