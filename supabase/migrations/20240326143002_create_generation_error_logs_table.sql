-- Migration: Create generation error logs table
-- Description: Creates the generation_error_logs table with RLS policies
-- Author: AI Assistant
-- Date: 2024-03-26

-- Create the generation_error_logs table
create table if not exists generation_error_logs (
    id serial primary key,
    user_id uuid references auth.users(id) not null,
    used_model text not null,
    input_text text not null,
    error_code varchar(100) not null,
    error_message text not null,
    created_at timestamptz not null default now()
);

-- Create indexes
create index if not exists generation_error_logs_user_id_idx on generation_error_logs(user_id);

-- Enable RLS
alter table generation_error_logs enable row level security;

-- Create RLS policies for authenticated users
create policy "Users can view their own error logs"
    on generation_error_logs for select
    to authenticated
    using (auth.uid() = user_id);

create policy "Users can create their own error logs"
    on generation_error_logs for insert
    to authenticated
    with check (auth.uid() = user_id);

-- Note: We don't need update and delete policies as error logs should be immutable

-- Create RLS policies for anonymous users (no access)
create policy "No access for anonymous users - select"
    on generation_error_logs for select
    to anon
    using (false);

create policy "No access for anonymous users - insert"
    on generation_error_logs for insert
    to anon
    with check (false); 