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

package admin::tags::OrderHistoryTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::tags::TableTag';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{status} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->setTagHelperFactory('admin::taghelpers::OrderHistoryHelperFactory'->new());
        $self->setTagRequestHelperFactory('admin::taghelpers::OrderHistoryRequestHelperFactory'->new());
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
            my $request = $self->{pageContext}->getRequest();
            my $anyType = 'admin::taghelpers::OrderHistoryRequestHelperFactory'->new()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
            if (!defined($self->{status})) {
                my $helperClass = ref($anyType);
                my $method = $helperClass->getMethod("setOrderStatus", undef);
                my $result = $method->invoke($anyType, undef);
                return $result;
            } else {
                my $helperClass = ref($anyType);
                my $methodParams = [ref($self->{status})];
                my $method = $helperClass->getMethod("setOrderStatus", $methodParams);
                my $methodArgs = [$self->{status}];
                my $result = $method->invoke($anyType, $methodArgs);
                return $result;
            }
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
                    $self->getPropertiesHashMap()->put($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::STATUS, $self->{status});
                    if ($self->getCommand()->compareTo($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SETSTATUS) == 0) {
                        $self->setOrderStatus();
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
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::JspTagException;
use admin::taghelpers::OrderHistoryHelperFactory;
use admin::taghelpers::OrderHistoryRequestHelperFactory;
use org::allbinary::business::user::commerce::inventory::order::OrderHistoryData;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::LicensingException;
use admin::tags::TableTag;

1;

