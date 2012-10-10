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
        
    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
    }
       
</script>
