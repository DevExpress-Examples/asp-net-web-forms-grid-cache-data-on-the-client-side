<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128533468/13.1.4%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E123)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->

# Grid View for ASP.NET Web Forms - How to cache data on the client side
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e123/)**
<!-- run online end -->

This example shows how to cache row values on the client side and access them without a callback to the server.  

## Implementation Details

The Grid View control does not store all row values on the client. Because of this, the client-side [`ASPxClientGridView.GetRowValues`](https://docs.devexpress.com/AspNet/js-ASPxClientGridView.GetRowValues(visibleIndex-fieldNames-onCallback)) method sends callbacks to the server to load the values.

Use the steps below to cache the row values on the client:

1) Handle the [`ASPxGridView.CustomJSProperties`](https://documentation.devexpress.com/AspNet/DevExpress.Web.ASPxGridView.CustomJSProperties.event) event. Traverse the grid rows in this event handler and save the desired row values to `e.Properties`. This data is accessible on the client side:

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

2) Get the cached data as shown below:

```js
function ProcessRow(index) {
    alert(
        "The row id is '" + grid.cpTitleId[index - grid.GetTopVisibleIndex()]
        + "', and title is " + grid.cpTitles[index - grid.GetTopVisibleIndex()]
    );
}
```

## Files to Look At

* [Default.aspx](./CS/Solution/Default.aspx) (VB: [Default.aspx](./VB/Solution/Default.aspx))
* [Default.aspx.cs](./CS/Solution/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/Solution/Default.aspx.vb))

## Documentation
- [Passing Values Between Client and Server Sides](https://documentation.devexpress.com/#AspNet/CustomDocument11816)

## More Examples 
- [Grid View for ASP.NET Web Forms - How to update total summaries on the client side in Batch Edit mode](https://github.com/DevExpress-Examples/aspxgridview-batch-edit-update-total-summaries-on-client)
- [Grid View for ASP.NET Web Forms - Prevent the cell edit action on the client in batch edit mode](https://github.com/DevExpress-Examples/aspxgridview-prevent-batch-edit-action)
- [Grid View for ASP.NET Web Forms - How to hide a grid column on the client](https://github.com/DevExpress-Examples/aspxgridview-hide-a-grid-column-on-the-client)