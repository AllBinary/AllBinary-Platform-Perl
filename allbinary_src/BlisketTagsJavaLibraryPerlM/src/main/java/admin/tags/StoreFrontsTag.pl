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

package admin::tags::StoreFrontsTag;
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
        $self->setTagHelperFactory('admin::taghelpers::StoreFrontsHelperFactory'->new());
        $self->setTagRequestHelperFactory('admin::taghelpers::StoreFrontsRequestHelperFactory'->new());
    return $self;
}


# throws LicensingException
sub generateSelect {
    my ($self) = @_;
        try {
            my $anyType = $self->getTagHelperFactoryInterface()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
            my $method = ref($anyType)->getMethod("generateSelect", undef);
            my $result = $method->invoke($anyType, undef);
            return $result;
        } catch ($e) {
            die $e;
        }
}


# throws LicensingException
sub install {
    my ($self) = @_;
        try {
            my $anyType = $self->getTagRequestHelperFactoryInterface()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
            my $method = ref($anyType)->getMethod("install", undef);
            my $result = $method->invoke($anyType, undef);
            return $result;
        } catch ($e) {
            die $e;
        }
}


# throws LicensingException
sub sendStoreCreatedEmails {
    my ($self) = @_;
        try {
            my $anyType = $self->getTagRequestHelperFactoryInterface()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
            my $method = ref($anyType)->getMethod("sendStoreCreatedEmails", undef);
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
                    my $storeFrontData = 'org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance();
                    if ($self->getCommand()->compareTo($storeFrontData->{SELECT}) == 0) {
                        $self->{pageContext}->getOut()->print($self->generateSelect());
                    } elsif ($self->getCommand()->compareTo($storeFrontData->{INSTALL}) == 0) {
                        $self->getPropertiesHashMap()->put("current", $self->getCurrent());
                        $self->getPropertiesHashMap()->put("total", $self->getTotal());
                        if (int($self->getCurrent()) == int($self->getTotal())) {
                            return $javax::servlet::jsp::tagext::TagSupport::EVAL_BODY_INCLUDE;
                        }
                        $self->install();
                    } elsif ($self->getCommand()->compareTo($storeFrontData->{INSTALL_COMPLETE}) == 0) {
                        $self->sendStoreCreatedEmails();
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
# use javax::servlet::jsp::tagext::TagSupport;
use admin::taghelpers::StoreFrontsHelperFactory;
use admin::taghelpers::StoreFrontsRequestHelperFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::LicensingException;
use admin::tags::TableTag;

1;

