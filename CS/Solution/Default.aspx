<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Solution.Default" %>

<!DOCTYPE html>

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
        <dx:ASPxGridView ID="grid" runat="server" Width="950px" AutoGenerateColumns="False"  DataSourceID="AccessDataSource1" KeyFieldName="title_id"
            OnCustomJSProperties="grid_CustomJSProperties">
            <SettingsPager PageSize="5" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="title_id" ReadOnly="True" />
                <dx:GridViewDataTextColumn FieldName="title"  />
                <dx:GridViewDataTextColumn FieldName="type" />
                <dx:GridViewDataDateColumn FieldName="pubdate" />
                <dx:GridViewDataTextColumn FieldName="price" />
                <dx:GridViewDataTextColumn Caption="button">
                    <DataItemTemplate>
                        <input type="button" value="Click Me" onclick="ProcessRow(<%# Container.VisibleIndex %>);" />
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </form>
</body>
</html>
