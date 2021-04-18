/// Description
Class API.REST Extends %CSP.REST
{

Parameter HandleCorsRequest = 1;

Parameter CONTENTTYPE = "application/json";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
	<Route Url="/test" Method="GET" Call="Test"/>
	<Route Url="/login" Method="POST" Call="Login"/>
	<Route Url="/getDoctors" Method="GET" Call="getDoctors"/>
	<!-- getDoctors -->
</Routes>
}

ClassMethod Test() As %Status
{
	Set currentDate = $ZDATE($NOW(), 3)
	Set obj = {"msg":"It works","today": (currentDate)}
	Write obj.%ToJSON()
	Return $$$OK
}

ClassMethod Login() As %Status
{
	Set sc = $$$OK
	try{
		set jo = {}.%FromJSON(%request.Content)
		set client = ##class(Dentistry.Patient).%New()
		set client.FIO = jo.FIO
		set client.birthDate = $ZDATEH(jo.birthDate, 3)
		set client.email = jo.email
		set client.phone = jo.phone
		set sc = client.%Save()
	} catch ex {
		Set errText = $SYSTEM.Status.GetErrorText(ex.AsStatus())
		Write errText
		return ex
	}
	Return sc
}

ClassMethod getDoctors() As %Status
{
	Set sc = $$$OK

	#; set sql = "select JSON_OBJECT('FIO':FIO, 'birthDate':birthDate, 'email': email, 'phone': phone) as doctor FROM Dentistry.Doctor"

	Set sql = "SELECT FIO, birthDate, email, phone FROM Dentistry.Doctor"
	Set obj = {"data": (sql)}
	Write obj.%ToJSON()
	Return sc
}

}
