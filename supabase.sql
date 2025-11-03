create extension if not exists pgcrypto;

create table if not exists public.registrations (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  name text not null,
  email text not null,
  phone text,
  date_of_birth date not null,
  source text,
  consent boolean not null default false,
  constraint chk_adult_only check (date_of_birth <= (current_date - interval '18 years'))
);

create index if not exists idx_registrations_created_at on public.registrations(created_at);

alter table public.registrations enable row level security;

drop policy if exists "allow_anon_insert_only" on public.registrations;
create policy "allow_anon_insert_only"
on public.registrations
for insert
to anon
with check (true);

-- No select/update/delete policies for anon
