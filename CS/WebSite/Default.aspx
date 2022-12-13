<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Data_Bind_Control_PassDataOnClient" %>
<%@ Register Assembly="DevExpress.Web.v15.1" Namespace="DevExpress.Web" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v15.1" Namespace="DevExpress.Web" TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Data caching on the client</title>
    <script type="text/javascript">
        function ProcessRow(index) {
            alert("The row id is '" + grid.cpTitleId[index - grid.GetTopVisibleIndex()] + "', and title is " + grid.cpTitles[index - grid.GetTopVisibleIndex()]);
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/pubs.mdb"
            SelectCommand="SELECT [title_id], [title], [type], [pubdate], [price] FROM [titles]"></asp:AccessDataSource>
        <dxwgv:ASPxGridView ID="grid" runat="server" Width="950px" AutoGenerateColumns="False"  DataSourceID="AccessDataSource1" KeyFieldName="title_id"
            OnCustomJSProperties="grid_CustomJSProperties">
            <SettingsPager PageSize="5" />
            <Columns>
                <dxwgv:GridViewDataTextColumn FieldName="title_id" ReadOnly="True" />
                <dxwgv:GridViewDataTextColumn FieldName="title"  />
                <dxwgv:GridViewDataTextColumn FieldName="type" />
                <dxwgv:GridViewDataDateColumn FieldName="pubdate" />
                <dxwgv:GridViewDataTextColumn FieldName="price" />
                <dxwgv:GridViewDataTextColumn Caption="button">
                    <DataItemTemplate>
                        <input type="button" value="Click Me" onclick="ProcessRow(<%# Container.VisibleIndex %>);" />
                    </DataItemTemplate>
                </dxwgv:GridViewDataTextColumn>
            </Columns>
        </dxwgv:ASPxGridView>
    </form>
</body>
</html>
