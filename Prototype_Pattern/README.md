This code is adapted from the book Apex Design Patterns with some modifications. All comments and the pattern summary were written by J. Kim.

# Salesforce Prototype Pattern Example

## Overview

This repository demonstrates the **Prototype Pattern** in Salesforce Apex. The Prototype Pattern is used to create a new object based on an existing object of the same class. It helps avoid repetitive code when initializing newly created objects and is particularly useful when creating copies of objects with complex states.

## Use Case

In this example, we simulate a scenario where an `OpportunityWrapper` class holds an `Opportunity` object. The Prototype Pattern is used to create a clone of the `OpportunityWrapper`, ensuring that changes to the cloned object do not affect the original object. This is achieved by implementing a deep clone method.

## Components

### 1. **IClone.cls**
An interface that defines the method `cloneObject()`. This interface is implemented by classes that need to provide a deep clone functionality.

### 2. **OpportunityWrapper.cls**
This class wraps an `Opportunity` object and implements the `IClone` interface to provide a deep clone method. The `cloneObject()` method creates a deep copy of the `OpportunityWrapper` by cloning the underlying `Opportunity` object.

### 3. **Anonymous Apex to Test Prototype Pattern**
This example demonstrates how to use the `OpportunityWrapper` class and its `cloneObject()` method to create a deep clone of an `Opportunity`.

## Testing the Pattern

To test the implementation, follow these steps:

1. **Run the Code**: Execute the anonymous Apex code provided in the Developer Console to test the cloning functionality of the `OpportunityWrapper` class.

Opportunity opp = [SELECT Id, Name, StageName, CloseDate FROM Opportunity LIMIT 1];
OpportunityWrapper wr = new OpportunityWrapper();
wr.setOpportunity(opp);

// Clone the existing wrapper class
OpportunityWrapper clonedWrapper = (OpportunityWrapper)wr.cloneObject();

System.debug('Actual Opp Name Before Clone: ' + opp.Name);

// Change the name of the newly cloned Opportunity
clonedWrapper.setOpportunityName('Cloned Opp');
System.debug('Actual Opp Name After Clone Change: ' + opp.Name);
System.debug('Cloned Opp Name: ' + clonedWrapper.getOpportunityName());


2. **Expected Outcome**: The output should show that changes to the cloned `Opportunity` do not affect the original `Opportunity`, demonstrating the deep clone functionality provided by the Prototype Pattern.

Actual Opp Name Before Clone: [Original Opportunity Name]
Actual Opp Name After Clone Change: [Original Opportunity Name]
Cloned Opp Name: Cloned Opp
