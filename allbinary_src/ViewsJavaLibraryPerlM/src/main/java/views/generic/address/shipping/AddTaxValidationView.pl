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

package views::generic::address::shipping::AddTaxValidationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::generic::address::shipping::ShippingAddressView','org::allbinary::logic::control::validate::ValidationComponentInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


# throws Exception
sub isValid {
    my ($self) = @_;
        try {
            $self->{streetAddress} = 'org::allbinary::business::user::address::StreetAddress'->new($self->getRequest());
            my $storeFrontInterface = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($self->getTransformInfoInterface()->getStoreName());
            my $taxInterface = 'org::allbinary::business::user::commerce::money::tax::TaxFactory'->getInstance()->getInstance($self->{abeClientInformation}, $storeFrontInterface);
            if (!defined($taxInterface)) {
                return 0;
            }
            if ($taxInterface->isValid($self->{streetAddress}, $storeFrontInterface) == 0) {
                return 0;
            }
            my $billingAddressesEntity = 'org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntity'->new($self->getWeblisketSession()->getUserName());
            my $streetAddressList = $billingAddressesEntity->get();
            if (!defined($streetAddressList)) {
                return 0;
            }
            my $size = $streetAddressList->size();
            for (my $index = 0; $index < $size; $index++) {
                my $aStreetAddress = $streetAddressList->get($index);
                if ($aStreetAddress->getName()->compareTo($org::allbinary::business::user::address::ShippingAddressData::TAX) == 0) {
                    return 0;
                }
            }
            return 1;
        } catch ($e) {
            if ($views::generic::address::shipping::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::address::shipping::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to validate", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


# throws Exception
sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            my $storeFrontInterface = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($self->getTransformInfoInterface()->getStoreName());
            my $taxInterface = 'org::allbinary::business::user::commerce::money::tax::TaxFactory'->getInstance()->getInstance($self->{abeClientInformation}, $storeFrontInterface);
            if (!defined($taxInterface)) {
                $stringBuffer->append("Unable to Load Tax Component<br/>");
            } else {
                if ($taxInterface->isValid($self->{streetAddress}, $storeFrontInterface) == 0) {
                    $stringBuffer->append("Unable to validate address with Tax Component<br/>");
                }
            }
            my $billingAddressesEntity = 'org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntity'->new($self->getWeblisketSession()->getUserName());
            my $streetAddressList = $billingAddressesEntity->get();
            my $size = $streetAddressList->size();
            for (my $index = 0; $index < $size; $index++) {
                my $aStreetAddress = $streetAddressList->get($index);
                if ($aStreetAddress->getName()->compareTo($org::allbinary::business::user::address::ShippingAddressData::TAX) == 0) {
                    $stringBuffer->append("Not a valid tax location<br/>");
                }
            }
            return $stringBuffer->toString();
        } catch ($e) {
            if ($views::generic::address::shipping::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::address::shipping::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to create validateInfo", $self, "validationInfo()", $e);
            }
            return "Error Creating ValidationInfo";
        }
}


sub toValidationInfoDoc {
    my ($self) = @_;
        return undef;
}


sub toValidationInfoNode {
    my ($self, $document) = @_;
        return undef;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::address::ShippingAddressData;
use org::allbinary::business::user::address::StreetAddress;
use org::allbinary::business::user::commerce::money::tax::TaxFactory;
use org::allbinary::business::user::commerce::money::tax::modules::TaxModuleInterface;
use org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntity;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::generic::address::shipping::ShippingAddressView;

1;

