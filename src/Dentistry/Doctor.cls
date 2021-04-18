Class Dentistry.Doctor Extends (%Library.Persistent, %Populate, Dentistry.Person)
{

Relationship appointments As Dentistry.Appointment [ Cardinality = many, Inverse = doctor ];

Relationship schedules As Dentistry.Schedule [ Cardinality = many, Inverse = doctor ];

Property experience As %Library.String [ Required ];

Property education As %Library.String [ Required ];

Relationship specializations As Dentistry.Specialization [ Cardinality = many, Inverse = doctor ];

Storage Default
{
<Data name="DoctorDefaultData">
<Subscript>"Doctor"</Subscript>
<Value name="1">
<Value>Experience</Value>
</Value>
<Value name="2">
<Value>Education</Value>
</Value>
<Value name="3">
<Value>SpecID</Value>
</Value>
<Value name="4">
<Value>idPEP</Value>
</Value>
<Value name="5">
<Value>idDoctorA</Value>
</Value>
<Value name="6">
<Value>experience</Value>
</Value>
<Value name="7">
<Value>education</Value>
</Value>
<Value name="8">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="9">
<Value>FIO</Value>
</Value>
<Value name="10">
<Value>birthDate</Value>
</Value>
<Value name="11">
<Value>email</Value>
</Value>
<Value name="12">
<Value>phone</Value>
</Value>
</Data>
<DataLocation>^Dentistry.DoctorD</DataLocation>
<DefaultData>DoctorDefaultData</DefaultData>
<IdLocation>^Dentistry.DoctorD</IdLocation>
<IndexLocation>^Dentistry.DoctorI</IndexLocation>
<StreamLocation>^Dentistry.DoctorS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
