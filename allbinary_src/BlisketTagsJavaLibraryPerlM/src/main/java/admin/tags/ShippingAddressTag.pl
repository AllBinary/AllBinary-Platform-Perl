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

package admin::tags::ShippingAddressTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::tags::TableTag';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{value} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->setTagHelperFactory('admin::taghelpers::ShippingAddressHelperFactory'->new());
        $self->setTagRequestHelperFactory('admin::taghelpers::ShippingAddressHelperFactory'->new());
    return $self;
}


sub setValue {
    my ($self, $value) = @_;
        $self->{value} = $value;
}


# throws LicensingException
sub set {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::ShippingAddressHelperFactory'->new()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
            my $addressHelperClass = ref($anyType);
            my $method = $addressHelperClass->getMethod("set", undef);
            my $result = $method->invoke($anyType, undef);
            return $result;
        } catch ($e) {
            die $e;
        }
}


# throws LicensingException
sub setToBillingAddress {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::ShippingAddressHelperFactory'->new()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
            my $addressHelperClass = ref($anyType);
            my $method = $addressHelperClass->getMethod("setToBillingAddress", undef);
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
            if ($self->isEnabled()) {
                if (defined($self->getCommand())) {
                    if ($self->getCommand()->compareTo($org::allbinary::business::user::address::ShippingAddressData::SELECT) == 0) {
                        $self->set();
                        return $self->{EVAL_BODY_INCLUDE};
                    } elsif ($self->getCommand()->compareTo($org::allbinary::business::user::address::ShippingAddressData::SETTOBILLINGADDRESS) == 0) {
                        $self->setToBillingAddress();
                    } else {
                        return $self->SUPER::doStartTag();
                    }
                }
            }
            return $self->{SKIP_BODY};
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagLicensingRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}

# use java::lang::reflect::Method;
# use javax::servlet::jsp::JspTagException;
use admin::taghelpers::ShippingAddressHelperFactory;
use org::allbinary::business::user::address::ShippingAddressData;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::LicensingException;
use admin::tags::TableTag;

1;

