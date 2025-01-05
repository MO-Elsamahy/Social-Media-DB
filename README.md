# SocialMedia Database Project

A **comprehensive and scalable database design** for a modern social media platform. This project provides a robust foundation for managing users, content, interactions, messaging, analytics, security, advertising, events, and support.

---

## Table of Contents
1. [Features](#features)
2. [Database Schema](#database-schema)
3. [Database Diagram](#database-diagram)

---

## Features
The database is designed to support the following core functionalities:

### **User Management**
- **User Profiles**: Store detailed user information, including usernames, emails, bios, and profile pictures.
- **Roles and Permissions**: Define and assign user roles (e.g., Admin, User) with specific permissions.
- **Settings**: Manage user preferences, such as themes and notification settings.

### **Content Management**
- **Posts**: Enable users to create, update, and manage posts.
- **Comments**: Allow users to comment on posts.
- **Hashtags**: Organize and categorize content using hashtags.

### **Interactions**
- **Likes, Shares, and Reactions**: Track user interactions with posts.
- **Bookmarks**: Allow users to save posts for later viewing.

### **Messaging**
- **Direct Messages**: Facilitate private messaging between users.
- **Notifications**: Notify users about new messages, likes, comments, and other activities.

### **Analytics**
- **User Activity**: Log user actions, such as logins and post creations.
- **Post Analytics**: Track post performance metrics, including views, likes, shares, and comments.
- **Engagement Scores**: Measure and analyze user engagement over time.

### **Security**
- **Login Attempts**: Monitor and log user login attempts for security purposes.
- **Password History**: Track password changes to enhance security.
- **Blocked Users**: Manage relationships between users who have blocked each other.

### **Advertising**
- **Ad Campaigns**: Create and manage advertising campaigns.
- **Ad Impressions**: Track ad views and user interactions.

### **Events**
- **Event Management**: Organize and manage events.
- **RSVPs**: Track user attendance and responses to events.

### **Support**
- **Support Tickets**: Handle user support requests efficiently.
- **Ticket Replies**: Manage responses to support tickets.

---

## Database Schema
The database is organized into **10 schemas**, each serving a specific purpose:

### **UserManagement**
- `Users`: Core user profiles.
- `UserFollows`: Follower relationships.
- `UserSettings`: User preferences and settings.
- `UserRoles`: Defined roles (e.g., Admin, User).
- `UserRoleAssignments`: Role assignments for users.

### **Content**
- `Posts`: User-generated posts.
- `PostMedia`: Media files attached to posts.
- `Comments`: Comments on posts.
- `Hashtags`: Hashtags used in posts.
- `PostHashtags`: Links between posts and hashtags.

### **Interaction**
- `Likes`: Likes on posts.
- `Shares`: Shares of posts.
- `Reactions`: Reactions (e.g., like, love) on posts.
- `Bookmarks`: Bookmarked posts.

### **Messaging**
- `Messages`: Direct messages between users.
- `Notifications`: User notifications.
- `MessageAttachments`: Attachments in messages.

### **Analytics**
- `UserActivity`: Logs user activities.
- `PostAnalytics`: Tracks post performance.
- `UserEngagement`: Calculates user engagement scores.

### **Security**
- `LoginAttempts`: Logs login attempts.
- `PasswordHistory`: Stores password changes.
- `BlockedUsers`: Tracks blocked users.

### **Settings**
- `PrivacySettings`: Manages user privacy preferences.
- `NotificationSettings`: Manages notification preferences.

### **Advertising**
- `AdCampaigns`: Advertising campaigns.
- `Ads`: Individual ads.
- `AdImpressions`: Tracks ad impressions.

### **Events**
- `Events`: Event details.
- `EventAttendees`: Tracks event attendees.

### **Support**
- `SupportTickets`: Support tickets.
- `TicketReplies`: Replies to support tickets.

---

## Database Diagram

![Social_Media-2025-01-05_22-06](https://github.com/user-attachments/assets/9c4c59eb-b177-4839-b6eb-767d6687905c)
