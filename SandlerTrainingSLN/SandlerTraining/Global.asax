<%@ Application Language="C#" %>
<%@ Import Namespace="Sandler.UI.ChartStructure" %>
<%@ Import Namespace="System.Web.Http" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="System.Runtime.Serialization " %>
<script runat="server">
     
    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        RouteTable.Routes.MapHttpRoute(
        name: "DefaultApi",
        routeTemplate: "api/{controller}/{id}",
        defaults: new { id = System.Web.Http.RouteParameter.Optional }
        );
        


        RouteTable.Routes.MapHttpRoute(
             name: "ActionApi",
             routeTemplate: "api/{controller}/{action}/{id}",
             defaults: new { id = System.Web.Http.RouteParameter.Optional }
         );
        

        var json = GlobalConfiguration.Configuration.Formatters.JsonFormatter;
        json.SerializerSettings.PreserveReferencesHandling =
            Newtonsoft.Json.PreserveReferencesHandling.All;
        
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        DateTime terminationDate = new DateTime(2013, 12, 31);

        if (DateTime.Now.Date >= terminationDate)
            throw new Exception("Project terminated.");
    }

    void Session_End(object sender, EventArgs e) 
    {
       
    }
       
</script>
