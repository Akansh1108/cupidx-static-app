# CupidX Registration Microsite — Setup Guide

## Supabase Setup
1. Create a Supabase project at [supabase.com](https://supabase.com).
2. Go to Project Settings → API and copy your **Project URL** and **anon key**.
3. Go to SQL Editor and run the contents of `supabase.sql`.

## Local Edit
Open `index.html` and replace:
- `YOUR_SUPABASE_URL` with `https://YOUR-PROJECT-REF.supabase.co`
- `YOUR_SUPABASE_ANON_KEY` with the anon key string

## GitHub & Vercel Deploy
1. Create a public GitHub repo, commit all files, and push.
2. In Vercel: New Project → Import repo → Framework preset: “Other” → just deploy (no build step).

## Security Notes
- RLS prevents public reads/updates/deletes. Only anonymous inserts allowed.
- 18+ is **enforced** in UI and DB.
- After success, form hides and a confirmation block appears.
- Page is fully responsive (mobile ≤360px and desktop).

## Customization
Modify modal Privacy text (contact line) and style as needed.
For high traffic, add captcha or use Edge Function to rate-limit.
Optionally move anon key to Vercel env and inject at build if you later add a step.

## .vercel.json
