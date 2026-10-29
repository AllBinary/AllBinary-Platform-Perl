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

package admin::tags::PaymentTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::tags::TableTag';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{storeName} = undef;
    $self->{propertiesHashMap} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->setTagHelperFactory('admin::taghelpers::PaymentHelperFactory'->new());
        $self->setTagRequestHelperFactory('admin::taghelpers::PaymentHelperFactory'->new());
    return $self;
}


sub setStoreName {
    my ($self, $value) = @_;
        $self->{storeName} = $value;
}


# throws LicensingException
sub select {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::PaymentHelperFactory'->new()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
            my $addressHelperClass = ref($anyType);
            my $method = $addressHelperClass->getMethod("select", undef);
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
                $self->{propertiesHashMap} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
                $self->{propertiesHashMap}->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $self->{storeName});
                if (defined($self->getCommand())) {
                    if ($self->getCommand()->compareTo($org::allbinary::business::user::commerce::money::payment::PaymentData::SELECT) == 0) {
                        my $output = $self->select();
                        if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGEXTRAOUTPUT})) {
                            $self->{pageContext}->getOut()->print($output . "<br />");
                        }
                        return $self->{EVAL_BODY_INCLUDE};
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
use java::util::HashMap;
# use javax::servlet::jsp::JspTagException;
use admin::taghelpers::PaymentHelperFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::user::commerce::money::payment::PaymentData;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::LicensingException;
use admin::tags::TableTag;

1;

