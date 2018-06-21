
Feature: cluster functionality

  Scenario: Creating a cluster
    Given I am an foo user with admin rights
    When I create a cluster
    Then then should appear in the list api
    When I add another cluster
    Then both clusters should appear in the list api
    And user bar should not see the clusters

  Scenario: Getting cluster
    Given I am an foo user with admin rights
    When I create a cluster
    Then should be able to view the details using get method

  Scenario: Deleting a cluster
    Given I am an foo user with admin rights
    When I create a cluster
    Then the cluster should be in the list api
    When I delete the cluster
    Then it should not be in the list api

  Scenario: Create a group with one node using instance-file plugin
    Given I am an user foo with admin rights
    Given There is a instance-file plugin
    When I create a group with one node i.e one file
    Then File should be visible

  Scenario: Create a group with instance-file and flavour-bash
    Given I am an user foo with admin rights
    Given There is a instance-file plugin and flavour-bash plugin
    When I create a group with two nodes using instance-file and flavour-bash plugin
    Then Two files should be visible and text on their file.

  Scenario: Creating a group within a group
    Given I am an user foo with admin rights
    Given I create a cluster with two groups
    Then The node should be created and flavour plugin for both instances executed
    Then The flavour plugin for the whole group should be executed.

  Scenario: Creating a group with multiple flavours
    Given I am a user foo with admin rights
    Given I create a cluster with two flavours
    Then Both flavours should be implemented

  Scenario: A node in a group is deleted
    Given I am an user foo with admin rights
    Given A cluster exists with two nodes
    When I delete one node
    Then a new node is created

  Scenario: All nodes in a group are deleted
    Given I am an user foo with admin rights
    Given A cluster exists with three nodes
    When I delete all the nodes
    Then two nodes are created

  Scenario: One of the node health check fails
    Given I am a user with admin rights
    Given A cluster exists with two nodes
    When one node fails health check
    Then A new node is created
    Then Its deleted from the server.

  Scenario: Node create state transition
    Given I am a user with admin rights
    When I create a cluster
    Then The status should be creating on the nodes
    Then Should be able to see the logs of the nodes as it creates
    Then Should be able to see the command running on the node
    When the node is done creating
    Then The state should be deployed in both nodes and cluster status
    When one node fails health check
    Then the status of one node should be unhealthy and cluster status should be unhealthy
    Then The cluster should auto-heal it self and both status should be healthy

  Scenario: Node creation fails.
    Given I am a user with admin rights
    When I create a cluster with two nodes
    When the node creation fails
    Then I should try three times before giving up
    Then change the status to terminated

  Scenario: Group cluster without auto-heal
    Given A cluster with two nodes exists
    When one node fails health check
    Then the state should change to unhealthy
    Then the state should remain like that
    When I create the node manually and delete the other one
    Then the state should change to healthy




