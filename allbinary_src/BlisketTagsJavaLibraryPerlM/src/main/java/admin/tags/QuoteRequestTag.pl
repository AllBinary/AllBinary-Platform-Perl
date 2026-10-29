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

package admin::tags::QuoteRequestTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::tags::TableTag';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{storeName} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->setTagHelperFactory('admin::taghelpers::QuoteHelperFactory'->new());
        $self->setTagRequestHelperFactory('admin::taghelpers::QuoteRequestHelperFactory'->new());
    return $self;
}


sub setStoreName {
    my ($self, $storeName) = @_;
        $self->{storeName} = $storeName;
}


# throws LicensingException
sub email {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::QuoteHelperFactory'->new()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
            my $helperClass = ref($anyType);
            my $method = $helperClass->getMethod("email", undef);
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
            if (defined($self->getCommand())) {
                $self->getPropertiesHashMap()->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $self->{storeName});
                if ($self->getCommand()->compareTo("EMAIL") == 0) {
                    $self->email();
                    return $self->{EVAL_BODY_INCLUDE};
                } else {
                    return $self->SUPER::doStartTag();
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
use admin::taghelpers::QuoteHelperFactory;
use admin::taghelpers::QuoteRequestHelperFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::LicensingException;
use admin::tags::TableTag;

1;

