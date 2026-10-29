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

package org::allbinary::logic::communication::http::request::session::BasicWeblisketSession;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{session} = undef;
    $self->{pageContext} = undef;
}


sub new {
    my ($class, $pageContext) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{pageContext} = $pageContext;
        my $request = $pageContext->getRequest();
        $self->{session} = $request->getSession(1);
    return $self;
}


sub setRole {
    my ($self, $aRole) = @_;
        $self->{session}->setAttribute($org::allbinary::business::user::role::BasicUserRoleData::NAME->toString(), $aRole);
}


sub getRole {
    my ($self) = @_;
        return $self->{session}->getAttribute($org::allbinary::business::user::role::BasicUserRoleData::NAME->toString());
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


# Java overloaded method: Perl keeps the last definition
sub setAuthenticated {
    my ($self, $value) = @_;
        $self->{session}->setAttribute($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::AUTHENTICATED, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE_STRING});
}


sub clear {
    my ($self) = @_;
        $self->{session}->removeAttribute($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::AUTHENTICATED);
        $self->{session}->removeAttribute($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::TIMEOUT);
        $self->{session}->removeAttribute($org::allbinary::business::user::role::BasicUserRoleData::NAME->toString());
        $self->{session}->removeAttribute($org::allbinary::business::user::UserData::USERNAME);
}


sub getCreationTime {
    my ($self) = @_;
        return $self->{session}->getCreationTime();
}


sub getLastAccessedTime {
    my ($self) = @_;
        my $lastAccessedTime = $self->{session}->getLastAccessedTime();
        return $lastAccessedTime;
}

# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::http::HttpSession;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::user::UserData;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData;
use org::allbinary::business::user::role::BasicUserRole;
use org::allbinary::business::user::role::BasicUserRoleData;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::logic::communication::http::request::session::WeblisketSessionData;

1;

