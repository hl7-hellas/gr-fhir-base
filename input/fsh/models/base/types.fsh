Logical: GreekIdentifier
Title: "Identifier logical model"
Description: """Identifier of an entity (patient, practitioner, but also device)"""

* type 0..1 code "The type of this identifier"
  """To be used to determine for a purpose of use of this identifier"""
* authority 0..1 string "Issuer"
  """Information about issuer of this identifier"""
* value 1..1 string "The value of this identifier"
  """The unique value"""
////////////////////////////////////////////////////////////////////////////////////////////////////
Logical: GreekHumanName
Title: "Greek human name logical model"
Description: """Logical model of Greek human name"""

* text 1..1 string "The full name of a person"
  """The full name as it should be presented/displayed to human reader. This should be provided regardless if family and given are available separately"""
* family 0..* string "Last name"
  """The last name of a person. A person can have more than one"""
* given 0..1 string "First name"
  """The first name of a person"""
* fatherName 0..1 string "Father's name"
  """The father's name of a person"""
////////////////////////////////////////////////////////////////////////////////////////////////////
Logical: GreekAddress
Title: "Greek address logical model"
Description: """Logical model of Greek address"""

* use 0..1 Coding "Address' purpose"
  """Information about the address, e.g., home address, work address, old address"""
* text 1..1 string "The full address"
  """The full address as it should be presented/displayed to human reader"""
* street 0..1 string "Name of the street"
  """"""
* houseNumber 0..1 string "House number"
  """"""
* city 0..1 string "City"
  """"""
* postalCode 0..1 string "Postal code"
  """"""
* country 0..1 Coding "Country name (and country code)"
  """"""
////////////////////////////////////////////////////////////////////////////////////////////////////
Logical: GreekContactPoint
Title: "Greek contact point logical model"
Description: """Identifier of an entity (patient, practitioner, but also device)"""

* use 0..1 Coding "The use of this contact point"
  """Information about contact point use such are home or work phone numbers or email addresses"""
* type 0..1 Coding "The type of this contact point"
  """Information about contact point type such are phone or email address"""
* value 1..1 string "The value of this contact point"
  """The actual contact point details"""
