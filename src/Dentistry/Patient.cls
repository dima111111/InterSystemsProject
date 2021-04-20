Class Dentistry.Patient Extends (%Library.Persistent, %Populate, Dentistry.Person)
{

Relationship appointments As Dentistry.Appointment [ Cardinality = many, Inverse = patient ];

Property medicalHistory As %Library.String;

Property addInfo As %Library.String;

Index emailKey On email [ Unique ];

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
<Value name="6">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="7">
<Value>FIO</Value>
</Value>
<Value name="8">
<Value>birthDate</Value>
</Value>
<Value name="9">
<Value>email</Value>
</Value>
<Value name="10">
<Value>phone</Value>
</Value>
</Data>
<DataLocation>^Dentistry.PatientD</DataLocation>
<DefaultData>PatientDefaultData</DefaultData>
<IdLocation>^Dentistry.PatientD</IdLocation>
<IndexLocation>^Dentistry.PatientI</IndexLocation>
<StreamLocation>^Dentistry.PatientS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
