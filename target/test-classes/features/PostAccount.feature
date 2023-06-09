Feature: TEK Insurance API Post Request

  @PostPrimaryAccount
  Scenario: Post Primary Account Service Test
    Given url appURL
    * def tokenValue = call read("GenerateToken.feature")
    * def token = tokenValue.response.token
    * header Authorization = "Bearer " + token
    * path "/api/accounts/add-primary-account"
    * def generator = Java.type("test.api.DataGenerator")
    * def email = generator.getEmail()
    * def firstName = generator.getFirstName()
    * def lastName = generator.getLastName()
    * def title = generator.getTitle()
    * def dateOfBirth = generator.getDOB()
    * def gender = generator.getGender()
    * def employmentStatus = generator.getEmploymentStatus()
    * def maritalStatus = generator.getMaritalStatus()
    * request
      """
      {
      "email": "#(email)",
      "firstName": "#(firstName)",
      "lastName": "#(lastName)",
      "title": "#(title)",
      "gender": "#(gender)",
      "maritalStatus": "#(maritalStatus)",
      "employmentStatus": "#(employmentStatus)",
      "dateOfBirth": "#(dateOfBirth)",
      "new": true
      }
      """
      * method post 
      * status 201
      * print response
