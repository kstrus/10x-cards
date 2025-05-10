-- Migration: Create generations table
-- Description: Creates the generations table with RLS policies
-- Author: AI Assistant
-- Date: 2024-03-26

-- Create function for updating updated_at timestamp
create or replace function update_updated_at_column()
returns trigger as $$
begin
    new.updated_at = now();
    return new;
end;
$$ language plpgsql;

-- Create the generations table
create table if not exists generations (
    id serial primary key,
    user_id uuid references auth.users(id) not null,
    generated_count integer not null,
    accepted_unedited_count integer,
    accepted_edited_count integer,
    used_model text not null,
    input_text text not null,
    duration integer not null,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);

-- Create indexes
create index if not exists generations_user_id_idx on generations(user_id);

-- Enable RLS
alter table generations enable row level security;

-- Create RLS policies for authenticated users
create policy "Users can view their own generations"
    on generations for select
    to authenticated
    using (auth.uid() = user_id);

create policy "Users can create their own generations"
    on generations for insert
    to authenticated
    with check (auth.uid() = user_id);

create policy "Users can update their own generations"
    on generations for update
    to authenticated
    using (auth.uid() = user_id);

create policy "Users can delete their own generations"
    on generations for delete
    to authenticated
    using (auth.uid() = user_id);

-- Create RLS policies for anonymous users (no access)
create policy "No access for anonymous users - select"
    on generations for select
    to anon
    using (false);

create policy "No access for anonymous users - insert"
    on generations for insert
    to anon
    with check (false);

-- Create trigger for updating updated_at timestamp
create trigger update_generations_updated_at
    before update on generations
    for each row
    execute function update_updated_at_column(); 