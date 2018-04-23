using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxTabControl;
using System.Drawing;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxEditors;
using System.Collections.Generic;
using DevExpress.Data;

public partial class Data_Bind_Control_PassDataOnClient : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void grid_CustomJSProperties(object sender, ASPxGridViewClientJSPropertiesEventArgs e) {
        int startIndex = grid.PageIndex * grid.SettingsPager.PageSize;
        int end = Math.Min(grid.VisibleRowCount, startIndex + grid.SettingsPager.PageSize);
        object[] titleId = new object[end - startIndex], titles = new object[end - startIndex];
        for(int n = startIndex; n < end; n++) {
            titleId[n - startIndex] = grid.GetRowValues(n, "title_id");
            titles[n - startIndex] = grid.GetRowValues(n, "title");
        }
        e.Properties["cpTitleId"] = titleId;
        e.Properties["cpTitles"] = titles;
    }
}


