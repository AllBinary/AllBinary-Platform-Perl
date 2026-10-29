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

package org::allbinary::business::user::modules::admin::store::StoreAdminUser;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::user::modules::User';


sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of StoreAdminUser takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = $class->SUPER::new();
        # super(...) made $self above
    return $self;
}


sub _new1 {
    my ($class, $userHashMap) = @_;
    my $self = $class->SUPER::new($userHashMap);
        # super(...) made $self above
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

use java::util::HashMap;
use org::allbinary::business::user::modules::User;
use org::allbinary::logic::communication::http::request::session::WeblisketSessionInterface;

1;

