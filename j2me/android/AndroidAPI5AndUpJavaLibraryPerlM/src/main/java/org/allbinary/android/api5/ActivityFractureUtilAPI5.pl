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

package org::allbinary::android::api5::ActivityFractureUtilAPI5;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::android::api1::ActivityFractureUtilAPI1';

our $instance5 = 'org::allbinary::android::api5::ActivityFractureUtilAPI5'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{FEATURE_TOUCHSCREEN_MULTITOUCH} = "android.hardware.touchscreen.multitouch";
    $self->{FEATURE_TOUCHSCREEN} = "android.hardware.touchscreen";
    $self->{FEATURE_TOUCHSCREEN_MULTITOUCH_DISTINCT} = "android.hardware.touchscreen.multitouch.distinct";
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::android::api5::ActivityFractureUtilAPI5::instance5;
}


sub process {
    my ($self, $activity) = @_;
        my $touchScreenFactory = 'org::allbinary::input::motion::button::TouchScreenFactory'->getInstance();
        my $touchScreenTypeFactory = 'org::allbinary::input::motion::button::TouchScreenTypeFactory'->getInstance();
        $touchScreenFactory->setTouch($self->isTouch($activity));
        $touchScreenFactory->setMultiTouch($self->isMultiTouch($activity));
        $touchScreenFactory->setMultiTouchDistinct($self->isMultiTouchDistinct($activity));
        $touchScreenTypeFactory->update($activity);
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        'org::allbinary::logic::communication::log::PreLogUtil'->put($touchScreenFactory->toString(), $self, $commonStrings->{PROCESS});
}


sub isTouch {
    my ($self, $activity) = @_;
        return $self->isFeature($activity, $self->{FEATURE_TOUCHSCREEN});
}


sub isMultiTouch {
    my ($self, $activity) = @_;
        return $self->isFeature($activity, $self->{FEATURE_TOUCHSCREEN_MULTITOUCH});
}


sub isMultiTouchDistinct {
    my ($self, $activity) = @_;
        return $self->isFeature($activity, $self->{FEATURE_TOUCHSCREEN_MULTITOUCH_DISTINCT});
}


sub isFeature {
    my ($self, $activity, $property) = @_;
        return $activity->getPackageManager()->hasSystemFeature($property);
}

use android::app::Activity;
use org::allbinary::input::motion::button::TouchScreenTypeFactory;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::android::api1::ActivityFractureUtilAPI1;
use org::allbinary::input::motion::button::TouchScreenFactory;

1;

