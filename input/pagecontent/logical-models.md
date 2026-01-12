
### Logical models

## Patient

Logical model of Greek patient record sufficiently represents patient in all use cases.

- One or more patient's IDs
- One or more patient's names
- A patient's date of birth
- A patient's gender
- None, one, or more patient's addresses
- None, one, or more patient's contact information

<figure class="diagram">
  {% include patient-logical-model.svg %}
  <figcaption style="text-align:center">Patient record logical model</figcaption>
</figure>
<br clear="all"/>

## Professional

Logical model of Greek professional record sufficiently represents healthcare professional in all use cases.

- One or more professional's ID
- A professional's name
- A professional's gender
- None, one, or more professional's addresses
- None, one, or more professional's contact information
- One or more professional's specialty

<figure class="diagram">
  {% include professional-logical-model.svg %}
  <figcaption style="text-align:center">Professional record logical model</figcaption>
</figure>
<br clear="all"/>

## Provider

Logical model of Greek provider record sufficiently represents healthcare provider in all use cases.

- A provider's ID
- A provider's name
- None or one provider's type
- None or one provider's addresses
- None, one, or more provider's contact information
- None or one provider's parent organization

<figure class="diagram">
  {% include provider-logical-model.svg %}
  <figcaption style="text-align:center">Provider record logical model</figcaption>
</figure>
<br clear="all"/>

## Service

Logical model of Greek service record sufficiently represents healthcare service in all use cases.

- A service's ID
- A service's name
- A service's type
- None or one service's category
- None or one service's addresses
- None, one, or more service's contact information
- A service's provider

<figure class="diagram">
  {% include service-logical-model.svg %}
  <figcaption style="text-align:center">Service record logical model</figcaption>
</figure>
<br clear="all"/>
