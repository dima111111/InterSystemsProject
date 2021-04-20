Class Dentistry.Person [ Abstract ]
{

Property FIO As %Library.String;

Property birthDate As %Library.Date;

Property email As %Library.String;

Property phone As %Library.String;

Storage Default
{
<Data name="PersonDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FIO</Value>
</Value>
<Value name="3">
<Value>BirthDate</Value>
</Value>
<Value name="4">
<Value>Email</Value>
</Value>
<Value name="5">
<Value>Phone</Value>
</Value>
<Value name="6">
<Value>birthDate</Value>
</Value>
<Value name="7">
<Value>email</Value>
</Value>
<Value name="8">
<Value>phone</Value>
</Value>
</Data>
<DataLocation>^Dentistry.PersonD</DataLocation>
<DefaultData>PersonDefaultData</DefaultData>
<IdLocation>^Dentistry.PersonD</IdLocation>
<IndexLocation>^Dentistry.PersonI</IndexLocation>
<StreamLocation>^Dentistry.PersonS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
