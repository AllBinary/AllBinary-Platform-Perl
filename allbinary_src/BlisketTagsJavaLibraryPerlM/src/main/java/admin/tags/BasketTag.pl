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

package admin::tags::BasketTag;
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
sub isBasketEmpty {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::BasketHelperFactory'->new()->getInstance($self->{propertiesHashMap}, $self->{pageContext});
            my $method = ref($anyType)->getMethod("isBasketEmpty", undef);
            my $emptyBoolean = $method->invoke($anyType, undef);
            return $emptyBoolean;
        } catch ($e) {
            die $e;
        }
}


# throws LicensingException
sub addItemToBasket {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::BasketRequestHelperFactory'->new()->getInstance($self->{propertiesHashMap}, $self->{pageContext});
            my $method = ref($anyType)->getMethod("addItemToBasket", undef);
            my $emptyBoolean = $method->invoke($anyType, undef);
            return $emptyBoolean;
        } catch ($e) {
            die $e;
        }
}


# throws LicensingException
sub removeItemFromBasket {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::BasketRequestHelperFactory'->new()->getInstance($self->{propertiesHashMap}, $self->{pageContext});
            my $method = ref($anyType)->getMethod("removeItemFromBasket", undef);
            my $emptyBoolean = $method->invoke($anyType, undef);
            return $emptyBoolean;
        } catch ($e) {
            die $e;
        }
}


# throws LicensingException
sub adjustBasket {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::BasketRequestHelperFactory'->new()->getInstance($self->{propertiesHashMap}, $self->{pageContext});
            my $method = ref($anyType)->getMethod("adjustBasket", undef);
            my $emptyBoolean = $method->invoke($anyType, undef);
            return $emptyBoolean;
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
                if (($self->{command} cmp $org::allbinary::business::user::commerce::inventory::basket::BasketData::INSERT) == 0) {
                    if (!$self->addItemToBasket()) {
                        $self->{pageContext}->getOut()->println("Item is not currently being sold.<p/>");
                    }
                } elsif (($self->{command} cmp $org::allbinary::business::user::commerce::inventory::basket::BasketData::DELETE) == 0) {
                    $self->removeItemFromBasket();
                } elsif (($self->{command} cmp $org::allbinary::business::user::commerce::inventory::basket::BasketData::ADJUST) == 0) {
                    $self->adjustBasket();
                } elsif (($self->{command} cmp $org::allbinary::business::user::commerce::inventory::basket::BasketData::ISEMPTY) == 0) {
                    if ($self->isBasketEmpty()) {
                        return $self->{EVAL_BODY_INCLUDE};
                    } else {
                        return $self->{SKIP_BODY};
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
use admin::taghelpers::BasketHelperFactory;
use admin::taghelpers::BasketRequestHelperFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::user::commerce::inventory::basket::BasketData;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::LicensingException;
use tags::CustomTagSupport;

1;

