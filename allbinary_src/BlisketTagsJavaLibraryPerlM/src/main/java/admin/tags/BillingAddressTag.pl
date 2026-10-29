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

package admin::tags::BillingAddressTag;
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
        $self->setTagHelperFactory('admin::taghelpers::BillingAddressHelperFactory'->new());
        $self->setTagRequestHelperFactory('admin::taghelpers::BillingAddressHelperFactory'->new());
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
            my $anyType = 'admin::taghelpers::BillingAddressHelperFactory'->new()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
            my $addressHelperClass = ref($anyType);
            my $method = $addressHelperClass->getMethod("set", undef);
            my $result = $method->invoke($anyType, undef);
            return $result;
        } catch ($e) {
            die $e;
        }
}


# throws LicensingException
sub setToShippingAddress {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::BillingAddressHelperFactory'->new()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
            my $addressHelperClass = ref($anyType);
            my $method = $addressHelperClass->getMethod("setToShippingAddress", undef);
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
                    if ($self->getCommand()->compareTo($org::allbinary::business::user::address::BillingAddressData::SELECT) == 0) {
                        $self->set();
                        return $self->{EVAL_BODY_INCLUDE};
                    } elsif ($self->getCommand()->compareTo($org::allbinary::business::user::address::BillingAddressData::SETTOSHIPPINGADDRESS) == 0) {
                        $self->setToShippingAddress();
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
use admin::taghelpers::BillingAddressHelperFactory;
use org::allbinary::business::user::address::BillingAddressData;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::LicensingException;
use admin::tags::TableTag;

1;

