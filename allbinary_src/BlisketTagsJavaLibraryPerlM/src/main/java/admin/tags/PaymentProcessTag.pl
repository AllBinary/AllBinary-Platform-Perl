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

package admin::tags::PaymentProcessTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::StoreValidationTransformTag';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


# throws LicensingException, Exception
sub process {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::PaymentProcessHelperFactory'->new()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
            my $helperClass = ref($anyType);
            my $method = $helperClass->getMethod($self->{commonStrings}->{PROCESS}, undef);
            my $result = $method->invoke($anyType, undef);
            return $result;
        } catch ($e) {
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{LICENSINGERROR})) {
                $self->{logUtil}->put("LicensingException", $self, $self->{commonStrings}->{PROCESS}, $e);
            }
            die $e;
        }
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            if ($self->getCommand()->compareTo($admin::tags::org::allbinary->{globals}->{GLOBALS2}->{AUTHORIZEORDEREVALBODYONERROR}) == 0 || $self->getCommand()->compareTo($admin::tags::org::allbinary->{globals}->{GLOBALS2}->{AUTHORIZEORDERANDEVALBODY}) == 0 || $self->getCommand()->compareTo($admin::tags::org::allbinary->{globals}->{GLOBALS2}->{AUTHORIZEFORMEVALBODYONERROR}) == 0) {
                $self->{pageContext}->getOut()->print($self->process() . "<br />");
                if ($self->getCommand()->compareTo($admin::tags::org::allbinary->{globals}->{GLOBALS2}->{AUTHORIZEORDEREVALBODYONERROR}) == 0) {
                    return $self->{SKIP_BODY};
                } else {
                    return $self->{EVAL_BODY_INCLUDE};
                }
            } else {
                die ("No Such Payment Processing Command");
            }
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}

# use java::lang::reflect::Method;
# use javax::servlet::jsp::JspTagException;
use admin::taghelpers::PaymentProcessHelperFactory;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::LicensingException;
use tags::StoreValidationTransformTag;

1;

