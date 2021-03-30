/// Description
Class Dentistry.Patient Extends Dentistry.Person
{

Property ID As %Integer [ Required ];

Property MedicalHistory As %String [ Required ];

Property AddInfo As %String;

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
