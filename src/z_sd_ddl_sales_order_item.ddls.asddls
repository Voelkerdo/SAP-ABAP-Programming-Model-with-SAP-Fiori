@AbapCatalog.sqlViewName: 'Z_SD_SALES_O_ITM'
@AbapCatalog.compiler.compareFilter: true
--@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Order Item List'
define view Z_SD_DDL_SALES_ORDER_ITEM as select from SEPM_I_SalesOrderItem_E as Item
{
   --Projection view (remove fields from view) as data model 
   key Item.SalesOrder as SalesOrderKey,
   key Item.SalesOrderItem as ItemPositionNumber,
   --Item._SalesOrder_._Customer_.CompanyName,
   Item.Product as Product,
   @Semantics.currencyCode: true
   Item.TransactionCurrency as Currency,
   @Semantics.amount.currencyCode: 'Currency'
   Item.GrossAmountInTransacCurrency as GrossAmount,
   @Semantics.amount.currencyCode: 'Currency'
   Item.NetAmountInTransactionCurrency as NetAmount,
   @Semantics.amount.currencyCode: 'Currency'
   Item.TaxAmountInTransactionCurrency as TaxAmount,
   Item.ProductAvailabilityStatus as ProductAvailabilityStatus
}
