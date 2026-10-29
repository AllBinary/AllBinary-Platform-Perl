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

package views::generic::address::shipping::ValidationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::generic::address::shipping::ShippingAddressesView','org::allbinary::logic::control::validate::ValidationComponentInterface';



sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
        # super(...) made $self above
    return $self;
}


sub isValid {
    my ($self) = @_;
        my $billingAddressesEntity = 'org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntity'->new($self->getWeblisketSession()->getUserName());
        $self->{streetAddressList} = $billingAddressesEntity->get();
        if (!defined($self->{streetAddressList})) {
            return 0;
        }
        my $size = $self->{streetAddressList}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $streetAddress = $self->{streetAddressList}->get($index);
            if ($streetAddress->isValid() == 0) {
                $self->{streetAddressList}->remove($streetAddress);
            }
        }
        if ($self->{streetAddressList}->size() < 1) {
            return 0;
        }
        return 1;
}


sub validationInfo {
    my ($self) = @_;
        return "No Shipping Addresses to display.<br />";
}


sub toValidationInfoDoc {
    my ($self) = @_;
        return undef;
}


sub toValidationInfoNode {
    my ($self, $document) = @_;
        return undef;
}

use org::allbinary::business::user::address::StreetAddress;
use org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntity;
use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::generic::address::shipping::ShippingAddressesView;

1;

