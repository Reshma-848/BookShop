using my.bookshop as my from '../db/schema';

//Services used by Order handler where as customers data will be read only.

service ProcessorService { 
    entity Order as projection on my.Order;
    @readonly
    entity Customers as projection on my.Customers;
}

/**
 * Service used by administrators to manage customers and Order.
 */

service AdminService {
    entity Customers as projection on my.Customers;
    entity order as projection on my.Order;
    }


annotate ProcessorService.Order with @odata.draft.enabled; 