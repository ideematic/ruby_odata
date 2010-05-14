Feature: Service Should Generate a Proxy
  In order to consume the OData
  As a user
  I want to be able to access data
  
Background:
  Given an ODataService exists with uri: "http://localhost:2301/Services/Entities.svc"

Scenario: Service should respond to valid collections
  Then I should be able to call "Plans" on the service

Scenario: Service should not respond to an invalid collection
  Then I should not be able to call "X" on the service

Scenario: Service should respond to accessing a single entity by ID
  Then I should be able to call "Plans" on the service with args: "1"

Scenario: Access an entity by ID should return the entity type
  Given I call "Plans" on the service with args: "1"
  When I run the query
  Then the result should be of type "Plan"

Scenario: Entity should have the correct accessors
  Given I call "Plans" on the service with args: "1"
  When I run the query
  Then the result should have a method: "Id"
  And the result should have a method: "Code"
  And the result should have a method: "Name"
  And the result should have a method: "Description"
  And the result should have a method: "Price"
  And the result should have a method: "PromoDays"
  And the result should have a method: "ExpirationDate"
  And the result should have a method: "IsTrial"
  And the result should have a method: "FrequencyDays"
  And the result should have a method: "PayPalButtonId"
  And the result should have a method: "PlanType"
  
Scenario: Entity should an id
  Given I call "Plans" on the service with args: "1"
  When I run the query
  Then the method "Id" on the result should equal: "1"
  And the method "Code" on the result should equal: "TRL7DAY"
  And the method "Name" on the result should equal: "7 Day Free Trial"

Scenario: Navigation Properties should be included in results	
  Given I call "TempAccounts" on the service with args: "1"
  When I run the query
  Then the result should have a method: "Plan"
  And the method "Plan" on the result should be nil

Scenario: Navigation Properties should be able to be eager loaded
  Given I call "TempAccounts" on the service with args: "1"
  And I expand the query to include "Plan"
  When I run the query
  Then the method "Plan" on the result should be of type "Plan"
  And the method "Code" on the result's method "Plan" should equal: "TRL7DAY"











