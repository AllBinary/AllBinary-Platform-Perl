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

package org::allbinary::content::NotificationBuilder;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $NULL_NOTIFICATION_BUILDER, 'java::lang::LazyStatic', sub { 'org::allbinary::content::NotificationBuilder'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub build {
    my ($self, $context, $command, $message, $integer, $pendingIntent) = @_;
        return $org::allbinary::android::NullParcelable::NULL_PARCELABLE;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::android::NullParcelable ();
use javax::microedition::lcdui::Command ();
# use android::app::PendingIntent ();
# use android::content::Context ();
# use android::os::Parcelable ();

1;

