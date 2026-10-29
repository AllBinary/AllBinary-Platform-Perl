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

package org::allbinary::content::NotificationUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();

our $SINGLETON = 'org::allbinary::content::NotificationUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{notificationManager} = 'org::allbinary::data::resource::ResourceUtil'->getInstance()->getContext()->getSystemService($org::allbinary::content::Context::NOTIFICATION_SERVICE);
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::content::NotificationUtil::SINGLETON;
}


sub notify {
    my ($self, $command, $resource, $message) = @_;
        my $context = 'org::allbinary::data::resource::ResourceUtil'->getInstance()->getContext();
        my $intent = 'org::allbinary::content::CommandUriAction'->getInstance()->getIntent($command);
        my $integer = 'org::allbinary::data::resource::ResourceUtil'->getInstance()->getResourceId($resource);
        my $notification = 'org::allbinary::content::Notification'->new(int($integer), $message, int(Time::HiRes::time() * 1000));
        my $pendingIntent = 'org::allbinary::content::PendingIntent'->getActivity($context, 0, $intent, 0);
        $notification->setLatestEventInfo($context, $command->getLabel(), $message, $pendingIntent);
        $self->{notificationManager}->notify('org::allbinary::TsUtil'->getInstance()->hashCode($command), $notification);
}

# use javax::microedition::lcdui::Command;
use org::allbinary::data::resource::ResourceUtil;
use org::allbinary::TsUtil;
use org::allbinary::content::Context;
use org::allbinary::content::CommandUriAction;
use org::allbinary::content::Notification;
use java::lang::System;
use org::allbinary::content::PendingIntent;

1;

