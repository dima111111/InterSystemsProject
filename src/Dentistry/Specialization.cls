Class Dentistry.Specialization Extends %Library.Persistent
{

/// Description
Relationship specID As Dentistry.Doctor [ Cardinality = one, Inverse = idSpec ];

/// Description
Property type As %Library.String;

/// Description
Property description As %Library.String;

Storage Default
{
<Data name="SpecializationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>idSpec</Value>
</Value>
<Value name="3">
<Value>specID</Value>
</Value>
<Value name="4">
<Value>type</Value>
</Value>
<Value name="5">
<Value>description</Value>
</Value>
</Data>
<DataLocation>^Dentistry.SpecializationD</DataLocation>
<DefaultData>SpecializationDefaultData</DefaultData>
<IdLocation>^Dentistry.SpecializationD</IdLocation>
<IndexLocation>^Dentistry.SpecializationI</IndexLocation>
<StreamLocation>^Dentistry.SpecializationS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
