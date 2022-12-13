<%-- BeginRegion --%>
<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="Data_Bind_Control_PassDataOnClient" %>

<%@ Register Assembly="DevExpress.Web.v15.1"
	Namespace="DevExpress.Web" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v15.1"
	Namespace="DevExpress.Web" TagPrefix="dxwgv" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>Data caching on the client</title>
<script type="text/jscript">
function ProcessRow(index) {
	alert("The row id is '" + grid.cpTitleId[index - grid.visibleStartIndex] + "', and title is " + grid.cpTitles[index - grid.visibleStartIndex]);
}
</script>    

</head>
<body>
	<form id="form1" runat="server">

		<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/pubs.mdb"
			SelectCommand="SELECT [title_id], [title], [type], [pubdate], [price] FROM [titles]">
		</asp:AccessDataSource>
		<dxwgv:aspxgridview id="grid" runat="server" width="950px" AutoGenerateColumns="False" 
				DataSourceID="AccessDataSource1" KeyFieldName="title_id" 
				OnCustomJSProperties="grid_CustomJSProperties">
			<SettingsPager PageSize="5" />    
<%-- BeginRegion Columns --%>
			<Columns>
				<dxwgv:GridViewDataTextColumn Caption="title_id" FieldName="title_id" ReadOnly="True"
					VisibleIndex="1">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn Caption="title" FieldName="title" VisibleIndex="2">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn Caption="type" FieldName="type" VisibleIndex="3">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataDateColumn Caption="pubdate" FieldName="pubdate" VisibleIndex="4">
				</dxwgv:GridViewDataDateColumn>
				<dxwgv:GridViewDataTextColumn Caption="price" FieldName="price" VisibleIndex="5">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn Caption="button" VisibleIndex="6">
					<DataItemTemplate>
						<input type="button" value="Click Me" onclick="ProcessRow(<%#Container.VisibleIndex%>);" />
					</DataItemTemplate>
				</dxwgv:GridViewDataTextColumn>
			</Columns>
<%-- EndRegion --%>
		</dxwgv:aspxgridview>
	</form>
</body>
</html>