/// Description
Class Dentistry.Patient Extends Dentistry.Person
{

Relationship idPatient As Dentistry.Appointment [ Cardinality = many, Inverse = PatientID ];

Property MedicalHistory As %Library.String [ Required ];

Property AddInfo As %Library.String;

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
</Data>
<DefaultData>PatientDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
