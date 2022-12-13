using System;
using DevExpress.Web;

public partial class Data_Bind_Control_PassDataOnClient : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {  }
    protected void grid_CustomJSProperties(object sender, ASPxGridViewClientJSPropertiesEventArgs e) {
        int startIndex = grid.PageIndex * grid.SettingsPager.PageSize;
        int end = Math.Min(grid.VisibleRowCount, startIndex + grid.SettingsPager.PageSize);
        object[] titleId = new object[end - startIndex], titles = new object[end - startIndex];
        for (int n = startIndex; n < end; n++) {
            titleId[n - startIndex] = grid.GetRowValues(n, "title_id");
            titles[n - startIndex] = grid.GetRowValues(n, "title");
        }
        e.Properties["cpTitleId"] = titleId;
        e.Properties["cpTitles"] = titles;
    }
}


