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

# Java interface
package org::allbinary::logic::communication::smtp::event::UserEmailEventListenerInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::util::EventListener';



# throws Exception
sub onEmailSendRequest {
    my ($self, $userEmailInfoEvent) = @_;
    die "abstract method onEmailSendRequest";
}

# use java::util::EventListener;

1;

