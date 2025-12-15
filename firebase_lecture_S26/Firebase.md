DOCUMENT-BASED DATABASES & FIREBASE — Concept Overview

A backend is the part of an app that runs outside of the user’s device. It handles data storage, user accounts, security, and business logic. Instead of living in the app, it lives on servers and communicates with the app over the internet.

Document-based databases store data as self-contained documents (usually JSON-like) instead of rows and columns. Documents live inside collections, and each document can have different fields. This makes document databases flexible and easy to adapt as an app grows.

Google Firebase is a Backend-as-a-Service (BaaS) platform. It provides a ready-made backend so you don’t have to build or host your own servers. Firebase manages infrastructure, scaling, security, and networking for you.

Firestore is Firebase’s document-based database. It organizes data into collections and documents, supports real-time updates, and syncs data across devices. It is designed for mobile apps where data changes often and users expect instant updates.

Firebase Authentication manages user identity. It handles signing users in and out and provides a unique user ID for each user. That ID is commonly used to securely connect users to their data in Firestore.

Big picture:

The frontend (SwiftUI app) handles UI and user interaction

The backend (Firebase) handles users, data, and security

Auth answers “Who is the user?”

Firestore answers “What data belongs to them?”
