-- My Year: database for cloud sync.
-- Run once in Supabase → SQL Editor → New query → paste → Run.

create table if not exists public.items (
  user_id    uuid    not null default auth.uid() references auth.users on delete cascade,
  id         text    not null,
  data       jsonb   not null,
  updated_at bigint  not null,          -- ms timestamp from the device that last changed it
  deleted    boolean not null default false,
  primary key (user_id, id)
);

-- Each signed-in user can only see and change their own items.
alter table public.items enable row level security;

drop policy if exists "own items" on public.items;
create policy "own items" on public.items
  for all to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);
