# My Year

A personal year planner with reminders, preloaded with Basel-Stadt school holidays,
public holidays and Basel events for 2027. It installs on your phone and computer like
a normal app, works offline, and syncs across devices when you sign in.

## Files

| File | What it is |
|---|---|
| `index.html` | The whole app |
| `config.js` | Your Supabase URL + key (empty = no sync, data stays on the device) |
| `sw.js` | Offline support |
| `manifest.webmanifest`, `icons/` | App name and icons for installing |
| `supabase/setup.sql` | Creates the sync database |

## 1. Set up sync (Supabase, free)

1. Create an account and a new project at <https://supabase.com> (region: Central EU / Zurich or Frankfurt).
2. Open **SQL Editor → New query**, paste the contents of `supabase/setup.sql`, press **Run**.
3. Open **Project Settings → API** (or **Connect**) and copy:
   - the **Project URL**
   - the **publishable key** (or legacy **anon public** key) — *not* the secret/service_role key
4. Paste both into `config.js`.

## 2. Put it online (GitHub Pages, free)

```bash
git init && git add . && git commit -m "My Year"
gh repo create my-year --public --source . --push
gh api -X POST repos/{owner}/my-year/pages -f "source[branch]=main" -f "source[path]=/"
```

After a minute it is live at `https://<your-github-name>.github.io/my-year/`.

Then in Supabase → **Authentication → URL Configuration**, set **Site URL** to that address
(so the confirmation email links back to your app).

## 3. Install it

- **iPhone / iPad:** open the address in **Safari** → Share → **Add to Home Screen**.
- **Android:** open in Chrome → ⋮ menu → **Install app**.
- **Mac / PC:** open in Chrome or Edge → install icon in the address bar (or the 📲 Install button in the app).
  In Safari on Mac: File → **Add to Dock**.

Open the app, tap **Sign in → Create account**, confirm the email, sign in. Do the same sign-in on
your other devices and everything syncs.

## Notes

- Everything also works without signing in; it just stays on that device.
- Reminders show as cards when the app is open. Tap **🔔 Alerts** to also get system notifications
  (on iPhone this only works in the installed app, iOS 16.4+).
- To update the app later, edit the files and `git push`; installed apps pick up the change the next time they open online.
- Dates marked **TBC** are not officially confirmed yet — check bs.ch.
