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

package org::allbinary::android::api1::ActivityFractureUtilAPI1;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::android::ActivityFractureUtil';

our $instance = 'org::allbinary::android::api1::ActivityFractureUtilAPI1'->new();

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::android::api1::ActivityFractureUtilAPI1::instance;
}


# throws Exception
sub process {
    my ($self, $activity) = @_;
}


sub setFullScreen {
    my ($self, $activity) = @_;
        $activity->getWindow()->setFlags($android::view::WindowManager::LayoutParams->{FLAG_FULLSCREEN}, $android::view::WindowManager::LayoutParams->{FLAG_FULLSCREEN});
}

use org::allbinary::android::ActivityFractureUtil;
use android::app::Activity;
use android::view::WindowManager;

1;

