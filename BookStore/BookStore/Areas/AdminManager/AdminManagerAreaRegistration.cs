﻿using System.Web.Mvc;

namespace TravelTour1.Areas.AdminManager
{
    public class AdminManagerAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "AdminManager";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "AdminManager_default",
                "AdminManager/{controller}/{action}/{id}",
                new {Controller="HomeAdmin", action = "Create", id = UrlParameter.Optional }
            );
            
        }
    }
}