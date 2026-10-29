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

package views::generic::order::ValidationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::generic::order::OrderView','org::allbinary::logic::control::validate::ValidationComponentInterface';


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


sub isValid {
    my ($self) = @_;
        try {
            my $valid = 1;
            if ($self->{order}->isIdValid() == 0) {
                return 0;
            } else {
                $self->{orderHistory} = 'org::allbinary::business::user::commerce::inventory::order::OrderHistoryFactory'->getInstance($self->{order}->getId());
                if (!defined($self->{orderHistory}) || $self->{orderHistory}->isValid() == 0) {
                    return 0;
                }
                my $orderItems = 'org::allbinary::data::tables::user::commerce::inventory::order::OrderItemsEntity'->new();
                $self->{basketReview} = $orderItems->getBasketReview($self->{order}->getId());
                if (!defined($self->{basketReview}) || $self->{basketReview}->isValid() == 0) {
                    return 0;
                }
            }
            return $valid;
        } catch ($e) {
            if ($views::generic::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to validate form", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            if ($self->{order}->isIdValid() == 0) {
                $stringBuffer->append($self->{order}->getIdValidationInfo());
            } else {
                $self->{orderHistory} = 'org::allbinary::business::user::commerce::inventory::order::OrderHistoryFactory'->getInstance($self->{order}->getId());
                if (!defined($self->{orderHistory}) || $self->{orderHistory}->isValid() == 0) {
                    $stringBuffer->append("Order History data error for: ");
                    $stringBuffer->append($self->{order}->getId());
                    $stringBuffer->append("<br />");
                }
                my $orderItems = 'org::allbinary::data::tables::user::commerce::inventory::order::OrderItemsEntity'->new();
                $self->{basketReview} = $orderItems->getBasketReview($self->{order}->getId());
                if (!defined($self->{basketReview})) {
                    $stringBuffer->append("Order Items data error - does not exist for: ");
                    $stringBuffer->append($self->{order}->getId());
                    $stringBuffer->append("<br />");
                } elsif ($self->{basketReview}->isValid() == 0) {
                    $stringBuffer->append("Order Items data error - not valid for: ");
                    $stringBuffer->append($self->{order}->getId());
                    $stringBuffer->append("<br />");
                }
            }
            return $stringBuffer->toString();
        } catch ($e) {
            if ($views::generic::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::order::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to generate validation error info", $self, "validationInfo()", $e);
            }
            return "Error Validating Form";
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

use org::allbinary::business::user::commerce::inventory::order::OrderHistoryFactory;
use org::allbinary::data::tables::user::commerce::inventory::order::OrderItemsEntity;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::generic::order::OrderView;

1;

