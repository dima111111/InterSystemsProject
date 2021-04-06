Class Dentistry.PatientComment Extends %Library.Persistent
{

Property idPatientComment As %Library.String;

Relationship appointment As Dentistry.Appointment [ Cardinality = one, Inverse = correspondingProperty ];

Property rate As %Library.Integer;

Property result As %Library.String;

Storage Default
{
<Data name="PatientCommentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>idPatientComment</Value>
</Value>
<Value name="3">
<Value>appointment</Value>
</Value>
<Value name="4">
<Value>rate</Value>
</Value>
<Value name="5">
<Value>result</Value>
</Value>
</Data>
<DataLocation>^Dentistry.PatientCommentD</DataLocation>
<DefaultData>PatientCommentDefaultData</DefaultData>
<IdLocation>^Dentistry.PatientCommentD</IdLocation>
<IndexLocation>^Dentistry.PatientCommentI</IndexLocation>
<StreamLocation>^Dentistry.PatientCommentS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
