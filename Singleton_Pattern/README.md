# Salesforce Singleton Pattern Example

## Overview

This repository contains an example implementation of the **Singleton Pattern** in Salesforce Apex. The Singleton Pattern ensures that a class has only one instance and provides a global point of access to that instance. This is particularly useful in Salesforce to optimize the use of resources, such as SOQL queries, and to avoid hitting governor limits.

## Use Case

The use case involves a call center where opportunities and brokers are managed. The system needs to autopopulate area office details for both opportunities and brokers based on the state and city provided. To avoid redundant SOQL queries across different triggers, the Singleton Pattern is implemented.

## Components

### 1. **AreaOfficeUtil.cls**
- **Purpose**: A utility class that queries area office data and provides methods to retrieve office records based on state and city.
- **Singleton Implementation**: 
  - The class uses a private constructor to prevent direct instantiation.
  - A static method `getInstance()` ensures only one instance of the class is created during a transaction.
  - This minimizes SOQL queries by reusing the same instance across multiple triggers.

### 2. **OpportunityTrigger.trigger**
- **Purpose**: A trigger on the `Opportunity` object to autopopulate the area office field and manage broker commissions when an opportunity is closed.
- **Usage**: The trigger utilizes the singleton instance of `AreaOfficeUtil` to avoid redundant SOQL queries.

### 3. **BrokerTrigger.trigger**
- **Purpose**: A trigger on the `Broker__c` object to autopopulate the area office field based on the broker’s state and city.
- **Usage**: Like the `OpportunityTrigger`, it uses the singleton instance of `AreaOfficeUtil`.

## Benefits of the Singleton Pattern

- **Resource Optimization**: Reduces the number of SOQL queries by sharing a single instance of the utility class across multiple triggers.
- **Governor Limit Compliance**: Helps in adhering to Salesforce’s governor limits by minimizing resource usage.
- **Centralized Control**: Ensures that all parts of the codebase use the same instance, making the system more predictable and easier to manage.

## How to Use

1. **Deploy the Apex Classes and Triggers**: Deploy `AreaOfficeUtil.cls`, `OpportunityTrigger.trigger`, and `BrokerTrigger.trigger` to your Salesforce environment.
2. **Test the Functionality**: Create or update `Opportunity` and `Broker__c` records to see the Singleton Pattern in action. The area office field should be autopopulated based on the state and city, and no redundant SOQL queries should be executed.

## Conclusion

The Singleton Pattern is an effective design pattern in Salesforce Apex for managing resources efficiently. This example demonstrates how to implement and use the pattern to optimize SOQL queries and stay within Salesforce's governor limits.
