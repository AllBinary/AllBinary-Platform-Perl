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

our $SINGLETON = 'org::allbinary::content::NotificationUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{notificationManager} = 'org::allbinary::data::resource::ResourceUtil'->getInstance()->getContext()->getSystemService($android::content::Context::NOTIFICATION_SERVICE);
    $self->{notificationBuilder} = undef;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::content::NotificationUtil::SINGLETON;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $SDK_VERSION = 'org::allbinary::android::AndroidInfoFactory'->getInstance()->getVersion();
        if ($SDK_VERSION > 22) {
            $self->{notificationBuilder} = 'org::allbinary::content::NotificationBuilderAPI23'->new();
        } else {
            $self->{notificationBuilder} = $org::allbinary::content::NotificationBuilder::NULL_NOTIFICATION_BUILDER;
        }
    return $self;
}


sub notify {
    my ($self, $command, $resource, $message) = @_;
        my $context = 'org::allbinary::data::resource::ResourceUtil'->getInstance()->getContext();
        my $intent = 'org::allbinary::content::CommandUriAction'->getInstance()->getIntent($command);
        my $integer = 'org::allbinary::data::resource::ResourceUtil'->getInstance()->getResourceId($resource);
        my $FLAG_IMMUTABLE = 1 << 26;
        my $SDK_VERSION = 'org::allbinary::android::AndroidInfoFactory'->getInstance()->getVersion();
        my $pendingIntent = 'android::app::PendingIntent'->getActivity($context, 0, $intent, ($SDK_VERSION > 22 ? $FLAG_IMMUTABLE : 0));
        if (!defined($self->{notificationBuilder})) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->putF($commonStrings->{EXCEPTION}, $self, $commonStrings->{NOT_IMPLEMENTED});
            return;
        }
        $self->{notificationBuilder}->build($context, $command, $message, $integer, $pendingIntent);
}

# use javax::microedition::lcdui::Command;
use android::app::Notification;
use android::app::NotificationManager;
use android::app::PendingIntent;
use android::content::Context;
use android::content::Intent;
use org::allbinary::android::AndroidInfoFactory;
use org::allbinary::data::resource::ResourceUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::content::NotificationBuilder;
use org::allbinary::content::NotificationBuilderAPI23;
use org::allbinary::content::CommandUriAction;

1;

