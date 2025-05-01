# 10x Cards

## Project Description

10x Cards is a web application that allows users to create, manage, and generate educational flashcards using both manual input and AI-powered suggestions. The platform is designed to streamline the process of flashcard creation and improve learning through integration with spaced repetition algorithms.

## Tech Stack

- **Frontend:** Astro 5, React 19, TypeScript 5, Tailwind CSS 4, Shadcn/ui
- **Backend:** Supabase (PostgreSQL, authentication)
- **AI Integration:** Openrouter.ai (access to multiple AI models such as OpenAI, Anthropic, etc.)
- **CI/CD & Hosting:** GitHub Actions, DigitalOcean (Docker-based deployment)

## Getting Started Locally

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your_username/10x-cards.git
   cd 10x-cards
   ```
2. **Install dependencies:**
   ```bash
   npm install
   ```
3. **Run the development server:**
   ```bash
   npm run dev
   ```
4. **Additional Setup:**
   - Ensure you are using the Node.js version specified in the `.nvmrc` file.
   - Configure any required environment variables for Supabase and AI integration.

## Available Scripts

- `npm run dev` - Starts the development server.
- `npm run build` - Builds the project for production.
- `npm run preview` - Previews the production build locally.
- `npm run lint` - Run ESLint.
- `npm run lint:fix` - Fix ESLint issues.
- `npm run formatt` - Format whole project.


## Project Scope

- **Flashcard Creation:**
  - Manual creation via a modal with two fields: "front" (max 200 characters) and "back" (max 500 characters), including appropriate validation.
  - AI-powered flashcard generation from input text (ranging from 1000 to 10000 characters) with options to edit, accept, or reject the generated flashcards before saving.
- **Flashcard Management:**
  - Listing flashcards with pagination, search functionality, and options to edit or delete flashcards.
- **User Account Management:**
  - Registration, login, password change, and account deletion using secure authentication.
- **Real-time Synchronization:**
  - Instant updates of flashcard states (such as acceptance or edits) without the need for page refresh.
- **Spaced Repetition Integration:**
  - Synchronization with a spaced repetition algorithm to enhance study efficiency.

## Project Status

This project is currently in active development as an MVP.

## License

This project is licensed under the [MIT License](LICENSE). 