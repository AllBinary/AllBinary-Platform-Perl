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

package admin::tags::PaymentGatewayTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::tags::TableTag';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->setTagHelperFactory('admin::taghelpers::PaymentGatewayHelperFactory'->new());
        $self->setTagRequestHelperFactory('admin::taghelpers::PaymentGatewayHelperFactory'->new());
    return $self;
}


# throws LicensingException, Exception
sub process {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::PaymentGatewayHelperFactory'->new()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
            my $helperClass = ref($anyType);
            my $method = $helperClass->getMethod($self->{commonStrings}->{PROCESS}, undef);
            my $result = $method->invoke($anyType, undef);
            return $result;
        } catch ($e) {
            $self->{logUtil}->put("LicensingException", $self, $self->{commonStrings}->{PROCESS}, $e);
            die $e;
        }
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            if ($self->isEnabled()) {
                if ($self->getCommand()->compareTo($admin::tags::org::allbinary->{globals}->{GLOBALS2}->{AUTHORIZEORDEREVALBODYONERROR}) == 0 || $self->getCommand()->compareTo($admin::tags::org::allbinary->{globals}->{GLOBALS2}->{AUTHORIZEORDERANDEVALBODY}) == 0 || $self->getCommand()->compareTo($admin::tags::org::allbinary->{globals}->{GLOBALS2}->{AUTHORIZEFORMEVALBODYONERROR}) == 0) {
                    my $output = $self->process();
                    {
                        $self->{pageContext}->getOut()->print($output . "<br />");
                    }
                    if ($self->getCommand()->compareTo($admin::tags::org::allbinary->{globals}->{GLOBALS2}->{AUTHORIZEORDEREVALBODYONERROR}) == 0) {
                        return $self->{SKIP_BODY};
                    } else {
                        return $self->{EVAL_BODY_INCLUDE};
                    }
                } else {
                    return $self->SUPER::doStartTag();
                }
            }
            return $self->{SKIP_BODY};
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}

# use java::lang::reflect::Method;
# use javax::servlet::jsp::JspTagException;
use admin::taghelpers::PaymentGatewayHelperFactory;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::LicensingException;
use admin::tags::TableTag;

1;

