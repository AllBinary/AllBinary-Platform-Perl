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

package org::allbinary::android::api30::ActivityFractureUtilAPI30;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::android::api5::ActivityFractureUtilAPI5';

our $instance30 = 'org::allbinary::android::api30::ActivityFractureUtilAPI30'->new();

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::android::api30::ActivityFractureUtilAPI30::instance30;
}


sub setFullScreen {
    my ($self, $activity) = @_;
        my $window = $activity->getWindow();
        my $windowInsetsController = 'androidx::core::view::WindowCompat'->getInsetsController($window, $window->getDecorView());
        $windowInsetsController->hide($androidx::core::view::WindowInsetsCompat::Type->systemBars());
        $windowInsetsController->setSystemBarsBehavior($androidx::core::view::WindowInsetsControllerCompat::BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE);
}

use android::app::Activity;
use android::view::Window;
use androidx::core::view::WindowCompat;
use androidx::core::view::WindowInsetsCompat;
use androidx::core::view::WindowInsetsControllerCompat;
use org::allbinary::android::api5::ActivityFractureUtilAPI5;

1;

