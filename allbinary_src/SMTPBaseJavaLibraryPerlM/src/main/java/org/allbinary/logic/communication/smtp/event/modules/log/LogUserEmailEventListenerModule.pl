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

package org::allbinary::logic::communication::smtp::event::modules::log::LogUserEmailEventListenerModule;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::smtp::event::UserEmailEventListenerInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub onEmailSendRequest {
    my ($self, $userEmailInfoEvent) = @_;
        if ($org::allbinary::logic::communication::smtp::event::modules::log::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::event::modules::log::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
            my $message = "Logging EmailEvent - Temporary Listener for debugging.\n\n" . $userEmailInfoEvent->toString();
            $self->{logUtil}->putF($message, $self, "onEmailSendRequest");
        }
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::smtp::event::EmailEvent;
use org::allbinary::logic::communication::smtp::event::UserEmailEventListenerInterface;

1;

