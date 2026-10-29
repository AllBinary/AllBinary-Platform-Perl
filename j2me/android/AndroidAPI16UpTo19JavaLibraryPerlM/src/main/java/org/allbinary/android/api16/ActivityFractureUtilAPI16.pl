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

package org::allbinary::android::api16::ActivityFractureUtilAPI16;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::android::api5::ActivityFractureUtilAPI5';

our $instance16 = 'org::allbinary::android::api16::ActivityFractureUtilAPI16'->new();

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::android::api16::ActivityFractureUtilAPI16::instance16;
}


sub setFullScreen {
    my ($self, $activity) = @_;
        my $decorView = $activity->getWindow()->getDecorView();
        my $visibility = $android::view::View::SYSTEM_UI_FLAG_HIDE_NAVIGATION | $android::view::View::SYSTEM_UI_FLAG_FULLSCREEN;
        $decorView->setSystemUiVisibility($visibility);
}

use android::app::Activity;
use android::view::View;
use org::allbinary::android::api5::ActivityFractureUtilAPI5;

1;

