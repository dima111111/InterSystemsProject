/// Descript
/// 
Class Dentistry.Person Extends %Persistent
{

Property FIO As %String;

Property BirthDate As %Library.Date;

Property Email As %String;

Property Phone As %String;

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
</Data>
<DataLocation>^Dentistry.PersonD</DataLocation>
<DefaultData>PersonDefaultData</DefaultData>
<IdLocation>^Dentistry.PersonD</IdLocation>
<IndexLocation>^Dentistry.PersonI</IndexLocation>
<StreamLocation>^Dentistry.PersonS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
