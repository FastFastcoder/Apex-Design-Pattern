# Salesforce Strategy Pattern Example

## Overview

This repository demonstrates the **Strategy Pattern** in Salesforce Apex. The Strategy Pattern, also known as the Policy Pattern, allows you to select an algorithm or strategy at runtime to solve a problem. This pattern is particularly useful when you have multiple ways to perform an operation, and the exact method isn't known until runtime.

## Use Case

In this example, we simulate a Music Library portal where customers can add songs to their shopping cart and choose a payment method during checkout. The payment method (Credit Card, Debit Card, or PayPal) is selected at runtime using the Strategy Pattern.

## Components

### 1. **PaymentStrategy.cls**
An interface that defines the method `pay()`. All payment strategies implement this interface, providing a common structure for different payment methods.

### 2. **CreditCardStrategy.cls**
Implements the `PaymentStrategy` interface to handle payments using a credit card. This class processes payments via credit card.

### 3. **PaypalStrategy.cls**
Implements the `PaymentStrategy` interface to handle payments using PayPal. This class processes payments via PayPal.

### 4. **DebitCardStrategy.cls**
Implements the `PaymentStrategy` interface to handle payments using a debit card. This class processes payments via debit card.

### 5. **ShoppingCart.cls**
Manages songs in the shopping cart and processes payments using the selected payment strategy. It supports adding/removing songs and paying using the chosen strategy.

## Testing the Pattern

To test the implementation, follow these steps:

1. **Create Sample Records**: Use the following code in the Developer Console's anonymous window to create sample `Music_Library__c` records:

   ```apex
   List<Music_Library__c> lstSongs = new List<Music_Library__c>(); 
   lstSongs.add(new Music_Library__c(Title__c='Go Johnny go',  
                                     Album__c='Chuck Berry Is on Top',  
                                     price__c= 2.0)); 

   lstSongs.add(new Music_Library__c(Title__c='When Doves Cry',  
                                     Album__c='The Very Best Of Prince',  
                                     price__c= 2.5)); 

   lstSongs.add(new Music_Library__c(Title__c='Strobe',  
                                  Album__c='For Lack of a Better Name',  
                                     price__c= 2.0)); 

   insert lstSongs;

2. **Use the Strategy Pattern**: Fetch the songs and add them to the shopping cart, then process the payment using different strategies:

```apex
List<Music_Library__c> selectedSongs = [SELECT ID, price__c FROM Music_Library__c LIMIT 3]; 

ShoppingCart cart = new ShoppingCart(); 
for(Music_Library__c m : selectedSongs) { 
   cart.addSong(m); 
} 

// Pay using Credit Card
cart.pay(new CreditCardStrategy('Customer Name', '1234567891234567', '123', '11/2026'));

// Alternatively, pay using PayPal
cart.pay(new PaypalStrategy('abc@xyz.com', 'StrongPwd'));



The expected output will be:

Total amount to be paid - 6.5
Web service callout to pay using credit card
Web service callout to pay using PayPal Account