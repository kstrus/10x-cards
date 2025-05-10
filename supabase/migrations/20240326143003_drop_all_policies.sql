-- Migration: Drop all RLS policies
-- Description: Drops all previously defined RLS policies from flashcards, generations and generation_error_logs tables
-- Author: AI Assistant
-- Date: 2024-03-26

-- Drop policies from flashcards table
drop policy if exists "Users can view their own flashcards" on flashcards;
drop policy if exists "Users can create their own flashcards" on flashcards;
drop policy if exists "Users can update their own flashcards" on flashcards;
drop policy if exists "Users can delete their own flashcards" on flashcards;
drop policy if exists "No access for anonymous users - select" on flashcards;
drop policy if exists "No access for anonymous users - insert" on flashcards;

-- Drop policies from generations table
drop policy if exists "Users can view their own generations" on generations;
drop policy if exists "Users can create their own generations" on generations;
drop policy if exists "Users can update their own generations" on generations;
drop policy if exists "Users can delete their own generations" on generations;
drop policy if exists "No access for anonymous users - select" on generations;
drop policy if exists "No access for anonymous users - insert" on generations;

-- Drop policies from generation_error_logs table
drop policy if exists "Users can view their own error logs" on generation_error_logs;
drop policy if exists "Users can create their own error logs" on generation_error_logs;
drop policy if exists "No access for anonymous users - select" on generation_error_logs;
drop policy if exists "No access for anonymous users - insert" on generation_error_logs; 