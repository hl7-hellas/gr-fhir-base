// https://hl7.org/fhir/uv/shorthand/reference.html#defining-logical-models
Logical: GreekPatient
Title: "Greek patient logical model"
Description: """
FHIR logical model of Greek patient derived from the [Logical model](./logical-models.html#patient)
"""

* identifier 1..* GreekIdentifier "Patient's personal identifier"
  """An identifier of the patient that is unique within assigning authority. At least an ΑΜΚΑ (Αριθμός Μητρώου Κοινωνικής Ασφάλισης) for the Greek employment and insurance identification. Patient can have other identifiers"""

* name 1..* GreekHumanName "Patient's name(s)"
  """Patient's names - Name may contain distinct parts and it should contain at least full name as an unstructured text"""

* dateOfBirth 1..1 dateTime "Patient's date of birth"
  """The date of birth of the patient"""

* gender 1..1 Coding "Patient's gender"
  """Patient's gender for administration and record keeping purposes."""

* address 0..* GreekAddress "Patient's address(es)"
  """Patient's address(es) for administrative and contact purposes. Addresses may contain distinct parts (e.g., street address with house number, postal code, and city), and it should contain at least full address as an unstructured text"""

* contactPoint 0..* GreekContactPoint "Patient's contact points"
  """Patient's communication contact points such are phone number or an email address"""
