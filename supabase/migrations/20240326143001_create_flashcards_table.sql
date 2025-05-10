-- Migration: Create flashcards table
-- Description: Creates the flashcards table with RLS policies
-- Author: AI Assistant
-- Date: 2024-03-26

-- Create the flashcards table
create table if not exists flashcards (
    id serial primary key,
    user_id uuid references auth.users(id) not null,
    generation_id integer references generations(id) on delete set null,
    front varchar(200) not null,
    back varchar(500) not null,
    source text not null check (source in ('ai-full', 'ai-edited', 'manual')),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);

-- Create indexes
create index if not exists flashcards_user_id_idx on flashcards(user_id);
create index if not exists flashcards_generation_id_idx on flashcards(generation_id);

-- Enable RLS
alter table flashcards enable row level security;

-- Create RLS policies for authenticated users
create policy "Users can view their own flashcards"
    on flashcards for select
    to authenticated
    using (auth.uid() = user_id);

create policy "Users can create their own flashcards"
    on flashcards for insert
    to authenticated
    with check (auth.uid() = user_id);

create policy "Users can update their own flashcards"
    on flashcards for update
    to authenticated
    using (auth.uid() = user_id);

create policy "Users can delete their own flashcards"
    on flashcards for delete
    to authenticated
    using (auth.uid() = user_id);

-- Create RLS policies for anonymous users (no access)
create policy "No access for anonymous users - select"
    on flashcards for select
    to anon
    using (false);

create policy "No access for anonymous users - insert"
    on flashcards for insert
    to anon
    with check (false);

-- Create trigger for updating updated_at timestamp
create trigger update_flashcards_updated_at
    before update on flashcards
    for each row
    execute function update_updated_at_column(); 