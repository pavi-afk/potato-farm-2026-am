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
        // GeometryReader tells us how wide this square ended up, so the
        // text can scale with it instead of being a fixed size.
        GeometryReader { geometry in
            let size = geometry.size.width

            ZStack {
                if let potato {
                    Circle()
                        .fill(potato.color.gradient)
                        .shadow(color: .black.opacity(0.15), radius: size * 0.03, y: 1)

                    Text(potato.name)
                        .font(.system(size: size * 0.19, weight: .semibold))
                        .foregroundStyle(.white)
                        .shadow(color: .black.opacity(0.4), radius: 1)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .minimumScaleFactor(0.4)
                        .padding(size * 0.14)
                } else {
                    Circle()
                        .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [size * 0.05]))
                        .foregroundStyle(.secondary.opacity(0.4))

                    Text("\(plot)")
                        .font(.system(size: size * 0.2))
                        .foregroundStyle(.secondary)
                }
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
