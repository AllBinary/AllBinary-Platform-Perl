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

package tags::generic::order::history::OrderHistoryTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::StoreValidationTransformTag';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{status} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub setStatus {
    my ($self, $value) = @_;
        $self->{status} = $value;
}


# throws LicensingException
sub setOrderStatus {
    my ($self) = @_;
        try {
            my $anyType = 'taghelpers::OrderHistoryHelperFactory'->new()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
            my $helperClass = ref($anyType);
            my $method = $helperClass->getMethod("setOrderStatus", undef);
            my $result = $method->invoke($anyType, undef);
            return $result;
        } catch ($e) {
            die $e;
        }
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            $self->setName("Basic Order History View");
            $self->setObjectFile("views.generic.order.history.ValidationView");
            if (defined($self->getCommand())) {
                if ($self->getCommand()->compareTo($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SETSTATUS) == 0) {
                    $self->getPropertiesHashMap()->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::STATUS, $self->{status});
                    $self->{pageContext}->getOut()->print($self->setOrderStatus());
                } elsif ($self->getCommand()->compareTo($tags::generic::order::history::org::allbinary->{globals}->{GLOBALS2}->{VIEW}) == 0) {
                } else {
                    die ("No Such View Command: " . $self->getCommand());
                }
                return $self->SUPER::doStartTag();
            }
            die ("Command Null");
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagLicensingRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}

# use java::lang::reflect::Method;
# use javax::servlet::jsp::JspTagException;
use org::allbinary::business::user::commerce::inventory::order::OrderHistoryData;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::LicensingException;
use taghelpers::OrderHistoryHelperFactory;
use tags::StoreValidationTransformTag;

1;

