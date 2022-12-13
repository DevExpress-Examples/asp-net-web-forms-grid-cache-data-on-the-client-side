Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web
Imports System.Drawing
Imports System.Collections.Generic
Imports DevExpress.Data

Partial Public Class Data_Bind_Control_PassDataOnClient
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
	End Sub
	Protected Sub grid_CustomJSProperties(ByVal sender As Object, ByVal e As ASPxGridViewClientJSPropertiesEventArgs)
		Dim startIndex As Integer = grid.PageIndex * grid.SettingsPager.PageSize
		Dim [end] As Integer = Math.Min(grid.VisibleRowCount, startIndex + grid.SettingsPager.PageSize)
		Dim titleId As Object() = New Object([end] - startIndex - 1){}, titles As Object() = New Object([end] - startIndex - 1){}
		For n As Integer = startIndex To [end] - 1
			titleId(n - startIndex) = grid.GetRowValues(n, "title_id")
			titles(n - startIndex) = grid.GetRowValues(n, "title")
		Next n
		e.Properties("cpTitleId") = titleId
		e.Properties("cpTitles") = titles
	End Sub
End Class


