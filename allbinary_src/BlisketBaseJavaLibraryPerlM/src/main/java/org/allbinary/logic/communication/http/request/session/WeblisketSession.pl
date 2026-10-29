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

package org::allbinary::logic::communication::http::request::session::WeblisketSession;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::http::request::session::WeblisketSessionInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{session} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    die "No constructor of WeblisketSession takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $hashMap, $pageContext) = @_;
    my $self = $class->_new2($hashMap, $pageContext->getRequest());
        # this(...) made $self above
    return $self;
}


sub _new2 {
    my ($class, $hashMap, $httpServletRequest) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $propertiesHashMap = $hashMap;
        my $request = $httpServletRequest;
        $self->{session} = $request->getSession(1);
        if (!defined($self->getStoreName())) {
            $self->setStoreName($propertiesHashMap->get('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}));
        }
    return $self;
}


sub getId {
    my ($self) = @_;
        return $self->{session}->getId();
}


sub setPassword {
    my ($self, $password) = @_;
        $self->{session}->setAttribute($org::allbinary::business::user::UserData::PASSWORD, $password);
}


sub setUserName {
    my ($self, $userName) = @_;
        $self->{session}->setAttribute($org::allbinary::business::user::UserData::USERNAME, $userName);
}


sub setPaymentMethod {
    my ($self, $value) = @_;
        $self->{session}->setAttribute($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::NAME->toString(), $value);
}


sub setAuthenticated {
    my ($self) = @_;
        $self->{session}->setAttribute($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::AUTHENTICATED, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{TRUE_STRING});
}


sub setRole {
    my ($self, $aRole) = @_;
        $self->{session}->setAttribute($org::allbinary::business::user::role::UserRoleData::NAME->toString(), $aRole);
}


sub setAttempts {
    my ($self, $value) = @_;
        $self->{session}->setAttribute($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::ATTEMPTS, $value);
}


sub setTimeout {
    my ($self, $value) = @_;
        $self->{session}->setAttribute($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::TIMEOUT, $value);
}


sub setStoreName {
    my ($self, $value) = @_;
        $self->{session}->setAttribute('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $value);
}


sub getWebAppPath {
    my ($self) = @_;
        return $self->{session}->getAttribute($org::allbinary::logic::communication::http::request::session::org::allbinary->{globals}->{GLOBALS2}->{WEBAPPPATH});
}


sub getUserName {
    my ($self) = @_;
        return $self->{session}->getAttribute($org::allbinary::business::user::UserData::USERNAME);
}


sub getPassword {
    my ($self) = @_;
        return $self->{session}->getAttribute($org::allbinary::business::user::UserData::PASSWORD);
}


sub getPaymentMethod {
    my ($self) = @_;
        return $self->{session}->getAttribute($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::NAME->toString());
}


sub getAuthentication {
    my ($self) = @_;
        return $self->{session}->getAttribute($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::AUTHENTICATED);
}


sub getAttempts {
    my ($self) = @_;
        return $self->{session}->getAttribute($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::ATTEMPTS);
}


sub getTimeout {
    my ($self) = @_;
        return $self->{session}->getAttribute($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::TIMEOUT);
}


sub getStoreName {
    my ($self) = @_;
        return $self->{session}->getAttribute('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME});
}


# throws Exception
sub getRole {
    my ($self) = @_;
        my $userRole = $self->{session}->getAttribute($org::allbinary::business::user::role::UserRoleData::NAME->toString());
        if (defined($userRole)) {
            return 'org::allbinary::business::user::role::UserRoleB'->getRole($userRole->getBasicUserRole()->getRole());
        } else {
            return undef;
        }
}


# throws Exception
sub getOrder {
    my ($self) = @_;
        my $storeFrontInterface = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($self->getStoreName());
        my $basketName = $storeFrontInterface->getBasketName();
        if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($basketName)) {
            my $orderInterface = $self->{session}->getAttribute($basketName);
            if (!defined($orderInterface)) {
                $orderInterface = 'org::allbinary::business::user::commerce::inventory::order::Order'->new('org::allbinary::business::user::commerce::inventory::basket::Basket'->new());
            }
            $self->{session}->setAttribute($basketName, $orderInterface);
            return $orderInterface;
        } else {
            die ("Basket Name Not Found");
        }
}


# Java overloaded method: Perl keeps the last definition
sub setAuthenticated {
    my ($self, $value) = @_;
        $self->{session}->setAttribute($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::AUTHENTICATED, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE_STRING});
}


sub clear {
    my ($self) = @_;
        $self->{session}->removeAttribute($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::AUTHENTICATED);
        $self->{session}->removeAttribute($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::TIMEOUT);
        $self->{session}->removeAttribute($org::allbinary::business::user::role::UserRoleData::NAME->toString());
        $self->{session}->removeAttribute($org::allbinary::business::user::UserData::USERNAME);
}


sub getCreationTime {
    my ($self) = @_;
        return $self->{session}->getCreationTime();
}


sub getLastAccessedTime {
    my ($self) = @_;
        return $self->{session}->getLastAccessedTime();
}


sub removeBasket {
    my ($self) = @_;
        my $storeFrontInterface = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($self->getStoreName());
        my $basketName = $storeFrontInterface->getBasketName();
        if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($basketName)) {
            $self->{session}->removeAttribute($basketName);
        }
}

use java::util::HashMap;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::http::HttpSession;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::UserData;
use org::allbinary::business::user::commerce::inventory::basket::Basket;
use org::allbinary::business::user::commerce::inventory::order::Order;
use org::allbinary::business::user::commerce::inventory::order::OrderInterface;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData;
use org::allbinary::business::user::role::UserRole;
use org::allbinary::business::user::role::UserRoleB;
use org::allbinary::business::user::role::UserRoleData;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::communication::http::request::session::WeblisketSessionInterface;
use org::allbinary::logic::communication::http::request::session::WeblisketSessionData;

1;

