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

package admin::tags::OrderTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::CustomTagSupport';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{command} = undef;
    $self->{storeName} = undef;
    $self->{propertiesHashMap} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub setCommand {
    my ($self, $command) = @_;
        $self->{command} = $command;
}


sub setStoreName {
    my ($self, $value) = @_;
        $self->{storeName} = $value;
}


# throws LicensingException
sub process {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::OrderHelperFactory'->new()->getInstance($self->{propertiesHashMap}, $self->{pageContext});
            my $helperClass = ref($anyType);
            my $method = $helperClass->getMethod($self->{commonStrings}->{PROCESS}, undef);
            my $result = $method->invoke($anyType, undef);
            return $result;
        } catch ($e) {
            die $e;
        }
}


# throws LicensingException
sub setPaymentGateway {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::OrderHelperFactory'->new()->getInstance($self->{propertiesHashMap}, $self->{pageContext});
            my $addressHelperClass = ref($anyType);
            my $method = $addressHelperClass->getMethod("setPaymentGateway", undef);
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
            if (defined($self->{command})) {
                $self->{propertiesHashMap} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
                $self->{propertiesHashMap}->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $self->{storeName});
                if (($self->{command} cmp $admin::tags::org::allbinary->{globals}->{GLOBALS2}->{PROCESS}) == 0) {
                    $self->process();
                } elsif (($self->{command} cmp $org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::NAME->toString()) == 0) {
                    if ($self->setPaymentGateway() == 1) {
                        return $javax::servlet::jsp::tagext::TagSupport::EVAL_BODY_INCLUDE;
                    }
                }
            }
            return $javax::servlet::jsp::tagext::TagSupport::SKIP_BODY;
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagLicensingRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}

# use java::lang::reflect::Method;
use java::util::HashMap;
# use javax::servlet::jsp::JspTagException;
# use javax::servlet::jsp::tagext::TagSupport;
use admin::taghelpers::OrderHelperFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::LicensingException;
use tags::CustomTagSupport;

1;

