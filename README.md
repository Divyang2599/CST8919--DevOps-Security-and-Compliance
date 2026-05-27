# CST8919--DevOps-Security-and-Compliance

# CST8919 Lab 1 - Flask Web App with Auth0 Login

## What This Project Does

This is a simple Python web application built with Flask.
It uses Auth0 to handle user login and logout.
Only logged-in users can access the protected page.

---

## Concepts Used in This Lab

- **Authentication (AuthN):** Checking who you are (login with email/password)
- **Authorization (AuthZ):** Checking what you can access (protected page)
- **Identity Provider (IdP):** Auth0 handles the login for us
- **Service Provider (SP):** Our Flask app is the service the user wants to use
- **SSO:** After logging in once, you can access all pages without logging in again
- **JWT Token:** After login, Auth0 sends a token with user info to our app

---

## Project Structure

cst8919-lab1/
│
├── server.py          # Main Flask application
├── .env               # Environment variables (NOT pushed to GitHub)
├── .gitignore         # Files to ignore in Git
├── requirements.txt   # Python packages needed
│
└── templates/
├── home.html      # Home page (login/logout)
└── protected.html # Protected page (only for logged-in users)

---

## How to Set Up and Run This App

### Step 1 - Clone the Repository
```bash
git clone https://github.com/Divyang2599/CST8919--DevOps-Security-and-Compliance.git
cd CST8919--DevOps-Security-and-Compliance
```

### Step 2 - Create a Virtual Environment
```bash
python -m venv venv
venv\Scripts\activate
```

### Step 3 - Install Dependencies
```bash
pip install flask python-dotenv authlib requests
```

### Step 4 - Set Up Auth0
1. Go to [auth0.com](https://auth0.com) and create a free account
2. Create a new application → choose **Regular Web Application**
3. Go to Settings and copy your **Domain**, **Client ID**, and **Client Secret**
4. Set Allowed Callback URL to: `http://localhost:3000/callback`
5. Set Allowed Logout URL to: `http://localhost:3000`

### Step 5 - Create Your .env File
Create a file called `.env` in the project folder with this content:
AUTH0_CLIENT_ID=your_client_id_here
AUTH0_CLIENT_SECRET=your_client_secret_here
AUTH0_DOMAIN=your_domain.auth0.com
APP_SECRET_KEY=any_random_long_string

### Step 6 - Run the App
```bash
python server.py
```

Then open your browser and go to: `http://localhost:3000`

---

## How the App Works

1. User visits the home page
2. User clicks **Login**
3. Flask redirects the user to Auth0 login page
4. User enters their credentials on Auth0
5. Auth0 verifies the user and sends a token back to Flask
6. Flask stores the token in the session
7. User can now access the `/protected` page
8. If user is not logged in and tries to visit `/protected`, they get redirected to login

---

## Routes

| Route | Description |
|-------|-------------|
| `/` | Home page - shows login or logout button |
| `/login` | Redirects to Auth0 login |
| `/callback` | Auth0 sends user back here after login |
| `/logout` | Clears session and logs out |
| `/protected` | Only accessible when logged in |

---

## Demo Video

[YouTube Demo Link - Add your link here after recording]

---

## What I Learned

- How to integrate a third-party Identity Provider (Auth0) into a Flask app
- The difference between Authentication and Authorization
- How JWT tokens work after login
- How to protect routes so only logged-in users can access them
- How SSO works in real applications
