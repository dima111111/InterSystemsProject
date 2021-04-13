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
</Routes>
}

ClassMethod Test() As %Status
{
  Set currentDate = $ZDate($Now(), 3)
  Set obj = {"msg":"It works","today": (currentDate)}
  Write obj.%ToJSON()
  Return $$$OK
}

ClassMethod Login() As %Status
{
  Set sc = $$$OK
  // do something
  Return sc
}

}
