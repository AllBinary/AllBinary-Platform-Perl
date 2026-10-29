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

package org::allbinary::business::user::modules::customer::affiliate::AffiliateUser;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::user::modules::User';


sub _init_fields {
    my ($self) = @_;
    $self->{affiliateSales} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of AffiliateUser takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        # super(...) made $self above
        $self->{affiliateSales} = 'org::allbinary::business::advertisement::affiliate::sales::AffiliateSales'->new();
    return $self;
}


sub _new1 {
    my ($class, $userHashMap) = @_;
    my $self = $class->SUPER::new($userHashMap);
    $self->_init_fields();
        # super(...) made $self above
        $self->{affiliateSales} = 'org::allbinary::business::advertisement::affiliate::sales::AffiliateSales'->new();
    return $self;
}


sub validateSession {
    my ($self, $weblisketSession) = @_;
        $self->SUPER::validateSession($weblisketSession);
        $self->updateSession($weblisketSession);
}


sub updateSession {
    my ($self, $weblisketSession) = @_;
        $weblisketSession->setStoreName($self->getPermissions());
}


sub isSessionValid {
    my ($self) = @_;
        return $self->{affiliateSales}->isValid();
}

use java::util::HashMap;
use org::allbinary::business::advertisement::affiliate::sales::AffiliateSales;
use org::allbinary::business::user::modules::User;
use org::allbinary::logic::communication::http::request::session::WeblisketSessionInterface;

1;

