//
//  ContentView.swift
//  potato-farm
//
//  Created by YJ Soon on 7/25/26.
//

import SwiftUI

struct ContentView: View {
    /// A LazyVGrid needs one GridItem per column. Six flexible columns,
    /// each the same width, with 12 points of space between them.
    private let columns = Array(
        repeating: GridItem(.flexible(), spacing: 12),
        count: Farm.columns
    )

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // The grid itself: 42 plots laid out 6 across.
                    // LazyVGrid fills left to right, then wraps to the next row.
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(1...Farm.plotCount, id: \.self) { plot in
                            PlotView(plot: plot, potato: potatoes.potato(inPlot: plot))
                        }
                    }

                    footer
                }
                .padding()
            }
            .navigationTitle("🥔 Potato Farm")
        }
    }

    private var footer: some View {
        VStack(spacing: 8) {
            Text("\(potatoes.count) of \(Farm.plotCount) plots planted")
                .font(.footnote)
                .foregroundStyle(.secondary)

            if !potatoes.clashingPlots.isEmpty {
                Label(
                    "Two people have claimed plot \(list(potatoes.clashingPlots)) — pick another one.",
                    systemImage: "exclamationmark.triangle.fill"
                )
                .font(.footnote)
                .foregroundStyle(.orange)
                .multilineTextAlignment(.center)
            }

            if !potatoes.invalidPlots.isEmpty {
                Label(
                    "Plot \(list(potatoes.invalidPlots)) is outside 1–\(Farm.plotCount), so it won't show up.",
                    systemImage: "questionmark.circle.fill"
                )
                .font(.footnote)
                .foregroundStyle(.orange)
                .multilineTextAlignment(.center)
            }
        }
    }

    private func list(_ plots: [Int]) -> String {
        plots.map(String.init).joined(separator: ", ")
    }
}

#Preview {
    ContentView()
}
