@AbapCatalog.sqlViewName: 'Z_ITEMS_XXX'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'invoice items'

define view z_invoice_items 
  as select from sepm_sddl_so_invoice_item{
    
    header.buyer.company_name,
  
    sepm_sddl_so_invoice_item.sales_order_invoice_item_key,
    sepm_sddl_so_invoice_item.currency_code,
    sepm_sddl_so_invoice_item.gross_amount,
    sepm_sddl_so_invoice_item.item_position,
    
    case header.payment_status
        when 'P' then 'X'
        else ' '
        end as payment_status
    
}

where currency_code = 'USD'
