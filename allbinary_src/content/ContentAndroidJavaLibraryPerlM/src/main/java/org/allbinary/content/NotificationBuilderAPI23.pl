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

package org::allbinary::content::NotificationBuilderAPI23;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();
use parent -norequire,'org::allbinary::content::NotificationBuilder';


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub build {
    my ($self, $context, $command, $message, $integer, $pendingIntent) = @_;
        my $notification = 'android::app::Notification::Builder'->new($context)->setSmallIcon(int($integer))->setTicker($message)->setWhen(int(Time::HiRes::time() * 1000))->setContentTitle($command->getLabel())->setContentText($message)->setContentIntent($pendingIntent)->build();
        return $notification;
}

# use javax::microedition::lcdui::Command;
use android::app::Notification;
use android::app::Notification::Builder;
use android::app::PendingIntent;
use android::content::Context;
use android::os::Parcelable;
use org::allbinary::content::NotificationBuilder;
use java::lang::System;

1;

