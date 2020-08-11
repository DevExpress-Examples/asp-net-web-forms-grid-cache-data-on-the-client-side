<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# ASPxGridView - How to cache data on the client side
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e123/)**
<!-- run online end -->

By default, ASPxGridView does not store all row values on the client side. The client-side **ASPxClientGridView.GetRowValues** method uses callbacks to get them. This example shows how to cache values manually and get them on the client side without callbacks.  

### Steps to implement:

1) Handle the [ASPxGridView.CustomJSProperties](https://documentation.devexpress.com/AspNet/DevExpress.Web.ASPxGridView.CustomJSProperties.event) event. Traverse through your grid rows in this event handler and save the desired row values to **e.Properties**. This data will be accessible on the client side:
```cs
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
```
2) Get the cached data in the following way:

```js
  function ProcessRow(index) {
            alert("The row id is '" + grid.cpTitleId[index - grid.GetTopVisibleIndex()]
             + "', and title is " + grid.cpTitles[index - grid.GetTopVisibleIndex()]);
        }
```


**See Also:**
- [How to: Access Server Data on the Client Side](https://documentation.devexpress.com/#AspNet/CustomDocument11816)


