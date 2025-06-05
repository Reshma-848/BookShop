namespace my.bookshop;

using { cuid, managed, sap.common.CodeList } from '@sap/cds/common';

/**
* orders created by Customers.
*/
entity Order : cuid, managed {  
customer     : Association to Customers;
title        : String  @title : 'Title';
status       : Association to Status default 'N';
feedback        : Composition of many {
    key ID    : UUID;
    timestamp : type of managed:createdAt;
    author    : type of managed:createdBy;
    message   : String;
};
}

/**
* Customers details.
*/
entity Customers : managed { 
key ID        : String;
firstName     : String;
lastName      : String;
name          : String = firstName ||' '|| lastName;
email         : EMailAddress;
phone         : PhoneNumber;
order         : Association to many Order on order.customer = $self;
addresses     : Composition of many Addresses on addresses.customer = $self;
}

entity Addresses : cuid, managed {
customer      : Association to Customers;
city          : String;
postCode      : String;
streetAddress : String;
}

entity Status : CodeList {
key code: String enum {
    new = 'N';
    in_process = 'I'; 
    despatched = 'D'; 
    delivered = 'R'; 
    canceled = 'C';
};
criticality : Integer;
}

type EMailAddress : String;
type PhoneNumber : String;
