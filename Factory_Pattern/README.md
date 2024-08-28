This code is adapted from the book Apex Design Patterns with some modifications. All comments and the pattern summary were written by J. Kim.

# Salesforce Factory Method Pattern Example

## Overview

This repository demonstrates the **Factory Method Pattern** in Salesforce Apex. The pattern allows for the creation of objects without specifying the exact class name at design time, promoting flexibility and scalability in your code.

## Use Case

A company offers various customer support levels (Basic, Premium, Gold, Platinum). Each level has its own Service Level Agreement (SLA) and ticket limits. The Factory Method Pattern helps manage this by centralizing the creation of these support objects, making the code easier to extend and maintain.

## Components

- **Interface (`IAdminSupport`)**: Defines common methods like `getSLA()` and `allowedTickets()` that all support classes implement.
- **Concrete Classes**: Implement the interface to provide specific functionality for each support type (e.g., Basic, Premium).
- **Factory Class (`AdminSupportFactory`)**: Creates and returns the appropriate support object based on the support type.
- **Client Code (`SupportService`)**: Uses the factory to get and work with support objects.

## Benefits

- **Simplifies Object Creation**: Centralizes logic for creating objects.
- **Easy to Extend**: Add new support types without changing existing code.
- **Maintains Clean Code**: Adheres to principles like Single Responsibility and Loose Coupling.
