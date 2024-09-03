# Salesforce Builder Pattern Example

## Overview

This repository demonstrates the Builder Pattern in Salesforce Apex. The Builder Pattern is used to instantiate an object of a complex class using a step-by-step approach and return a constructed object at once. This pattern is particularly useful when many parameters are needed to construct and initialize an object, making it easier to manage and maintain code.

## Use Case

In this example, we simulate the creation of an `Opportunity` record in Salesforce, where multiple related objects such as `User` and `Area_Office__c` must be created and associated with the `Opportunity`. The Builder Pattern is employed to encapsulate the construction process of these related objects, ensuring that the required sequence of operations is maintained.

## Components

### 1. **IOppTestDataBuilder.cls**
An interface that defines the methods required to build test data for the `Opportunity` object. This interface ensures consistency and reusability across different implementations.

### 2. **OppTestData_ValidOfficeImpl.cls**
Implements the `IOppTestDataBuilder` interface to build an `Opportunity` with a valid relationship to an `Area_Office__c`. This class handles the creation of `User`, `Area_Office__c`, and `Opportunity` objects.

### 3. **OppTestData_Director.cls**
This class is responsible for managing the sequence of method calls required to build the `Opportunity` and its related records. It ensures that the methods are called in the correct order, adhering to the Builder Pattern principles.

### 4. **OpportunityTrigger_BuilderPattern_Test.cls**
This test class demonstrates the use of the Builder Pattern to create test data for an `Opportunity` trigger. It simplifies the test data creation process by using the `OppTestData_Director` and `OppTestData_ValidOfficeImpl` classes.

## Testing the Pattern

To test the implementation, follow these steps:

1. **Run the Test**: Execute the test class `OpportunityTrigger_BuilderPattern_Test` in the Developer Console to validate the Opportunity trigger. The Builder Pattern simplifies the test data creation process, making the test more readable and maintainable.

2. **Expected Outcome**: The test should pass successfully, confirming that the `Area_Office__c` lookup field on the `Opportunity` record is correctly populated.

---

This example showcases how the Builder Pattern can be effectively used in Salesforce to manage complex object creation scenarios, making the code more modular and easier to maintain.
