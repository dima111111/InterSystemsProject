/// Description
Class Dentistry.Patient Extends Dentistry.Person
{

Relationship idPatient As Dentistry.Appointment [ Cardinality = many, Inverse = PatientID ];

Property medicalHistory As %Library.String [ Required ];

Property addInfo As %Library.String;

Storage Default
{
<Data name="PatientDefaultData">
<Subscript>"Patient"</Subscript>
<Value name="1">
<Value>ID</Value>
</Value>
<Value name="2">
<Value>MedicalHistory</Value>
</Value>
<Value name="3">
<Value>AddInfo</Value>
</Value>
<Value name="4">
<Value>medicalHistory</Value>
</Value>
<Value name="5">
<Value>addInfo</Value>
</Value>
</Data>
<DefaultData>PatientDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
