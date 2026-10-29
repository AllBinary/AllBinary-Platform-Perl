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

package views::generic::address::billing::EditValidationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::generic::address::billing::BillingAddressView','org::allbinary::logic::control::validate::ValidationComponentInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{value} = undef;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{value} = $self->getPageContext()->getRequest()->getParameter($org::allbinary::business::user::address::StreetAddressData::ID);
    return $self;
}


sub isValid {
    my ($self) = @_;
        if (defined($self->getWeblisketSession()->getUserName())) {
            return 0;
        }
        my $billingAddressesEntity = 'org::allbinary::data::tables::user::address::billing::BillingAddressesEntity'->new($self->getWeblisketSession()->getUserName());
        $self->{streetAddress} = $billingAddressesEntity->get($self->{value});
        if (!defined($self->{streetAddress})) {
            return 0;
        }
        return $self->{streetAddress}->isValid();
}


sub validationInfo {
    my ($self) = @_;
        return $self->{streetAddress}->validationInfo();
}


sub toValidationInfoDoc {
    my ($self) = @_;
        return undef;
}


sub toValidationInfoNode {
    my ($self, $document) = @_;
        return undef;
}

use org::allbinary::business::user::address::StreetAddressData;
use org::allbinary::data::tables::user::address::billing::BillingAddressesEntity;
use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::generic::address::billing::BillingAddressView;

1;

