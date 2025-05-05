# Schemat bazy danych dla aplikacji Cards

## 1. Lista tabel

### Tabela users (obslugiwana przez Supabase Auth)
- **created_at**: TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
- **updated_at**: TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()

### Tabela flashcards
- **id**: SERIAL PRIMARY KEY
- **user_id**: INTEGER NOT NULL REFERENCES users(id)
- **generation_id**: INTEGER NULLABLE REFERENCES generations(id) ON DELETE SET NULL
- **front**: VARCHAR(200) NOT NULL
- **back**: VARCHAR(500) NOT NULL
- **source**: TEXT NOT NULL CHECK (source IN ('ai-full', 'ai-edited', 'manual'))
- **created_at**: TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
- **updated_at**: TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()

### Tabela generations
- **id**: SERIAL PRIMARY KEY
- **user_id**: INTEGER NOT NULL REFERENCES users(id)
- **generated_count**: INTEGER NOT NULL
- **accepted_unedited_count**: INTEGER NULLABLE
- **accepted_edited_count**: INTEGER NULLABLE
- **used_model**: TEXT NOT NULL
- **input_text**: TEXT NOT NULL
- **duration**: INTEGER NOT NULL -- czas trwania generacji w milisekundach
- **created_at**: TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
- **updated_at**: TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()

### Tabela generation_error_logs
- **id**: SERIAL PRIMARY KEY
- **user_id**: INTEGER NOT NULL REFERENCES users(id)
- **used_model**: TEXT NOT NULL
- **input_text**: TEXT NOT NULL
- **error_code**: VARCHAR(100) NOT NULL
- **error_message**: TEXT NOT NULL
- **created_at**: TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()

## 2. Relacje między tabelami
- Tabela `users` ma relację jeden-do-wielu z tabelami `flashcards`, `generations` oraz `generation_error_logs`.
- Kada fiszka (flascards) moze opcjonalnie odnosic się do jednej generaji (generations) przez `generation_id`

## 3. Indeksy
- Indeks na kolumnie `user_id` w tabeli `flashcards`
- Indeks na kolumnie `generation_id` w tabeli `flashcards`
- Indeks na kolumnie `user_id` w tabeli `generations`
- Indeks na kolumnie `user_id` w tabeli `generation_error_logs`

## 4. Zasady PostgreSQL (RLS)
- W tabelach `flashcards`, `generation_error_logs` oraz `generations` wdrożona zostanie polityka RLS ograniczająca operacje (SELECT, INSERT, UPDATE, DELETE) tylko do rekordów, których `user_id` odpowiada identyfikatorowi uzytkownika z Supabase Auth.
- Przykładowa konfiguracja RLS:

  ```sql
  -- Dla tabeli fiszki
  ALTER TABLE fiszki ENABLE ROW LEVEL SECURITY;
  CREATE POLICY user_access_fiszki ON flashcards
    USING (user_id = current_setting('app.current_user_id')::INTEGER);

  -- Dla tabeli generations
  ALTER TABLE generations ENABLE ROW LEVEL SECURITY;
  CREATE POLICY user_access_generations ON generations
    USING (user_id = current_setting('app.current_user_id')::INTEGER);
  ```

## 5. Dodatkowe uwagi
- Kolumny `created_at` są ustawiane domyślnie na CURRENT_TIMESTAMP, a `updated_at` powinny być automatycznie aktualizowane (np. poprzez trigger) przy każdej modyfikacji rekordu.