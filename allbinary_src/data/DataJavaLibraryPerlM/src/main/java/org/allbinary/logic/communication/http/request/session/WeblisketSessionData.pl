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

package org::allbinary::logic::communication::http::request::session::WeblisketSessionData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $INVALIDATESESSION = "SESSION_INVALIDATE_SESSION";
our $ATTEMPTS = "SESSION_ATTEMPTS";
our $TIMEOUT = "SESSION_TIMEOUT";
our $REMOVABLEUSERNAME = "SESSION_REMOVABLE_USER_NAME";
our $REMOVABLEPASSWORD = "SESSION_REMOVABLE_PASSWORD";
our $REMOVABLENEWPASSWORD = "SESSION_REMOVABLE_NEW_PASSWORD";
our $REMOVABLEREENTERNEWPASSWORD = "SESSION_REMOVABLE_REENTER_NEW_PASSWORD";
our $AUTHENTICATED = "SESSION_AUTHENTICATED";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


1;

