# 🥔 Potato Farm — 2026 AM Class

A SwiftUI app with a 6 × 7 grid of potato plots — 42 in total. Everyone in the
class claims one plot, gives it their name and a colour, and sends it in as a
pull request.

The grid is built with `LazyVGrid`, which is the bit worth reading once you've
planted your potato.

## Plant your potato

1. **Fork** this repository, then clone your fork.
2. Open `potato-farm.xcodeproj` in Xcode and run the app.
3. Find an empty plot. Empty plots are dashed circles showing their number,
   from 1 to 42, counting left to right and top to bottom.
4. Open **`potato-farm/Farmers.swift`** — the only file you need to change —
   and add one line to the list:

   ```swift
   Potato(plot: 12, name: "Your Name", color: .orange),
   ```

5. Run the app again. Your potato should be sitting in that plot.
6. Commit on a new branch, push, and open a pull request.

```bash
git checkout -b plant-your-name
git add potato-farm/Farmers.swift
git commit -m "feat: plant Your Name in plot 12"
git push -u origin plant-your-name
```

## House rules

- **One line each**, in the students section, kept in plot-number order.
- **Don't take a plot someone else has claimed.** If two people pick the same
  number, the app shows a warning underneath the grid — whoever's PR is second
  should move to a free plot.
- Only touch `Farmers.swift`. Changing other files makes pull requests harder
  to merge.
- Keep your name short so it fits inside the circle.

## Colours

```
.red  .orange  .yellow  .green  .mint  .teal  .cyan
.blue  .indigo  .purple  .pink  .brown  .gray  .black
```

Or mix your own, with values from 0 to 1:

```swift
Color(red: 0.9, green: 0.4, blue: 0.2)
```

## What's in here

| File | What it does |
| --- | --- |
| `Farmers.swift` | The list of everyone on the farm. **Edit this one.** |
| `Potato.swift` | What a potato is, and how big the field is. |
| `PlotView.swift` | Draws one circle — planted or empty. |
| `ContentView.swift` | Lays the 42 plots out with `LazyVGrid`. |
