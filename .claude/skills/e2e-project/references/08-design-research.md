# Design research — Pinterest moodboard (before every mockup)

Run this before Phase 5. Output: `clients/<slug>/research/pinterest-moodboard.html` and `clients/<slug>/research/design-direction.md`.

## 1. Searches
Write 4–6 English searches from the brief: the client's sector + "website design", the sector + "portfolio/landing page", one search per feel-word from E4 (e.g. "bold typography website"), and one that matches the client's brand color ("orange website design"). Add a Turkish search when the audience is local.

## 2. Collect pins (browser pane)
- Open `https://www.pinterest.com/search/pins/?q=<search>` in the built-in browser.
- Without signing in, Pinterest shows a sign-in dialog but still loads about 8–10 pins per search. Read their image URLs from the page (`img[src*="pinimg"]`, swap the size folder for `736x`). That is enough for a moodboard.
- For more pins the operator can sign in themselves in the browser pane. Never type their Pinterest (or any) credentials.
- Do not download the images; the moodboard page links them from Pinterest's CDN.

## 3. Moodboard page
Build a local HTML grid (5 columns, captions with pin numbers, grouped by search) in `research/`, open it in the browser pane, and look at every pin.

## 4. Design direction
In `design-direction.md`, list the patterns you see, with the pin numbers that show each one, and mark each pattern **use / don't use** with a reason tied to the brief (brand colors and fonts in E1/E2 always win over a trend). Finish with a 3–4 sentence direction: base colors, the one bold moment, how the work/products are shown, and the key interactions.

## 5. Rules
- Inspiration only: never copy a layout, illustration, photo or text from a pin. Never put a pin image in the mockup.
- Show the operator the moodboard and the direction **before** building the mockup, and ask: "Is this the direction you want for this client?"
- In the mockup, show the client's products/work as designed objects in their own brand colors (packaging, posters, app screens) whenever the client sells design or products; use stock photos only for people, places and textures.
