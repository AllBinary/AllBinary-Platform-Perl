#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::logic::visual::transform::info::BasicViewData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::visual::transform::info::BasicViewData'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{GENERICDIR} = "generic/";
    $self->{USERDIR} = $self->{GENERICDIR} . "user/";
    $self->{ADDRESSDIR} = $self->{USERDIR} . "address/";
    $self->{BILLINGADDRESSDIR} = $self->{ADDRESSDIR} . "billing/";
    $self->{SHIPPINGADDRESSDIR} = $self->{ADDRESSDIR} . "shipping/";
    $self->{COMMERCEDIR} = $self->{USERDIR} . "commerce/";
    $self->{INVENTORYDIR} = $self->{COMMERCEDIR} . "inventory/";
    $self->{BASKETDIR} = $self->{INVENTORYDIR} . "basket/";
    $self->{ITEMDIR} = $self->{INVENTORYDIR} . "item/";
    $self->{MONEYDIR} = $self->{COMMERCEDIR} . "money/";
    $self->{SHIPPINGDIR} = $self->{COMMERCEDIR} . "shipping/";
    $self->{ORDERDIR} = $self->{INVENTORYDIR} . "order/";
    $self->{ORDEREMAILDIR} = $self->{ORDERDIR} . "email/";
    $self->{ORDERHISTORYDIR} = $self->{ORDERDIR} . "history/";
    $self->{ORDERREVIEWDIR} = $self->{ORDERDIR} . "review/";
    $self->{PAYMENTDIR} = $self->{MONEYDIR} . "payment/";
    $self->{GENERATIONDIR} = $self->{GENERICDIR} . "generation/";
    $self->{PRODUCTSDIR} = $self->{GENERICDIR} . "products/";
    $self->{IGNOREXMLXSL} = $self->{GENERICDIR} . "ignoreXmlView.xsl";
    $self->{REVIEWORDERVIEWXSL} = $self->{ORDERREVIEWDIR} . "reviewOrderView.xsl";
    $self->{ORDERVIEWXSL} = $self->{REVIEWORDERVIEWXSL};
    $self->{INVENTORYXSL} = $self->{INVENTORYDIR} . "inventory.xsl";
    $self->{BASKETXSL} = $self->{BASKETDIR} . "basket.xsl";
    $self->{CHECKOUTBASKETXSL} = $self->{BASKETDIR} . "staticBasket.xsl";
    $self->{MINIBASKETXSL} = $self->{BASKETDIR} . "miniBasket.xsl";
    $self->{BILLINGADDRESSCHANGEFORMXSL} = $self->{BILLINGADDRESSDIR} . "billingAddressChangeForm.xsl";
    $self->{BILLINGADDRESSINPUTFORMXSL} = $self->{BILLINGADDRESSDIR} . "billingAddressInputForm.xsl";
    $self->{BILLINGADDRESSVIEWXSL} = $self->{BILLINGADDRESSDIR} . "billingAddressView.xsl";
    $self->{SHIPPINGADDRESSCHANGEFORMXSL} = $self->{SHIPPINGADDRESSDIR} . "shippingAddressChangeForm.xsl";
    $self->{SHIPPINGADDRESSINPUTFORMXSL} = $self->{SHIPPINGADDRESSDIR} . "shippingAddressInputForm.xsl";
    $self->{SHIPPINGADDRESSVIEWXSL} = $self->{SHIPPINGADDRESSDIR} . "shippingAddressView.xsl";
    $self->{NEWTAXADDRESSXSL} = $self->{SHIPPINGADDRESSDIR} . "newTaxAddressView.xsl";
    $self->{EDITTAXADDRESSXSL} = $self->{SHIPPINGADDRESSDIR} . "editTaxAddressView.xsl";
    $self->{SHIPPINGMETHODSXSL} = $self->{SHIPPINGDIR} . "shippingMethods.xsl";
    $self->{ORDERCUSTOMEREMAILVIEWXSL} = $self->{ORDEREMAILDIR} . "orderCustomerEmailView.xsl";
    $self->{ORDERMANAGEREMAILVIEWXSL} = $self->{ORDEREMAILDIR} . "orderManagerEmailView.xsl";
    $self->{EDITCUSTOMERXSL} = $self->{USERDIR} . "editCustomerInputForm.xsl";
    $self->{ORDERHISTORYXSL} = $self->{ORDERHISTORYDIR} . "orderHistory.xsl";
    $self->{PAYMENTVIEWXSL} = $self->{PAYMENTDIR} . "paymentView.xsl";
    $self->{SUMMARYXSL} = $self->{ITEMDIR} . "summary/summary.xsl";
    $self->{PAYMENTGATEWAYOPTIONSXSL} = $self->{PAYMENTDIR} . "paymentGatewayOptions.xsl";
    $self->{MAKEPAYMENTVIEWXSL} = $self->{PAYMENTDIR} . "invoice/" . "makePayment.xsl";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::visual::transform::info::BasicViewData::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


1;

