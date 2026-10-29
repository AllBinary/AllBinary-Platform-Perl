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

package org::allbinary::android::input::motion::button::TouchButtonAndroidResources;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::init::Init';


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub init {
    my ($self) = @_;
        my $resourceUtil = 'org::allbinary::data::resource::ResourceUtil'->getInstance();
        my $androidResources = 'org::allbinary::AndroidResources'->getInstance();
        my $RESOURCE_STRING_ARRAY = ['org::allbinary::input::motion::button::TouchButtonBlankResource'->getInstance(), 'org::allbinary::input::motion::button::TouchButtonGenericActionResource'->getInstance(), 'org::allbinary::input::motion::button::TouchButtonStartResource'->getInstance(), 'org::allbinary::input::motion::button::TouchButtonUpResource'->getInstance(), 'org::allbinary::input::motion::button::TouchButtonDownResource'->getInstance(), 'org::allbinary::input::motion::button::TouchButtonTurnLeftResource'->getInstance(), 'org::allbinary::input::motion::button::TouchButtonTurnRightResource'->getInstance(), 'org::allbinary::input::motion::button::TouchButtonStrafeLeftResource'->getInstance(), 'org::allbinary::input::motion::button::TouchButtonStrafeRightResource'->getInstance()];
        my $RESOURCE_ARRAY = [(0) x (scalar(@{$RESOURCE_STRING_ARRAY}))];
        if ('org::allbinary::input::motion::button::CommonButtons'->getInstance()->{STANDARD_BUTTON_SIZE} == 128) {
            $RESOURCE_ARRAY->[0] = $androidResources->{raw}->{touch_button_128_by_128};
            $RESOURCE_ARRAY->[1] = $androidResources->{raw}->{touch_button_generic_action_128_by_128};
            $RESOURCE_ARRAY->[2] = $androidResources->{raw}->{touch_button_start_128_by_128};
            $RESOURCE_ARRAY->[3] = $androidResources->{raw}->{touch_button_up_arrow_128_by_128};
            $RESOURCE_ARRAY->[4] = $androidResources->{raw}->{touch_button_down_arrow_128_by_128};
            $RESOURCE_ARRAY->[5] = $androidResources->{raw}->{touch_button_turn_left_arrow_128_by_128};
            $RESOURCE_ARRAY->[6] = $androidResources->{raw}->{touch_button_turn_right_arrow_128_by_128};
            $RESOURCE_ARRAY->[7] = $androidResources->{raw}->{touch_button_strafe_left_arrow_128_by_128};
            $RESOURCE_ARRAY->[8] = $androidResources->{raw}->{touch_button_strafe_right_arrow_128_by_128};
            if ('org::allbinary::logic::system::os::OperatingSystemFactory'->getInstance()->getOperatingSystemInstance()->isOverScan()) {
                $resourceUtil->addResource($RESOURCE_STRING_ARRAY->[2]->{HINT}, ("" . ($androidResources->{raw}->{ouya_o})));
            }
        } else {
            $RESOURCE_ARRAY->[0] = $androidResources->{raw}->{touch_button_64_by_64};
            $RESOURCE_ARRAY->[1] = $androidResources->{raw}->{touch_button_generic_action_64_by_64};
            $RESOURCE_ARRAY->[2] = $androidResources->{raw}->{touch_button_start_64_by_64};
            $RESOURCE_ARRAY->[3] = $androidResources->{raw}->{touch_button_up_arrow_64_by_64};
            $RESOURCE_ARRAY->[4] = $androidResources->{raw}->{touch_button_down_arrow_64_by_64};
            $RESOURCE_ARRAY->[5] = $androidResources->{raw}->{touch_button_turn_left_arrow_64_by_64};
            $RESOURCE_ARRAY->[6] = $androidResources->{raw}->{touch_button_turn_right_arrow_64_by_64};
            $RESOURCE_ARRAY->[7] = $androidResources->{raw}->{touch_button_strafe_left_arrow_64_by_64};
            $RESOURCE_ARRAY->[8] = $androidResources->{raw}->{touch_button_strafe_right_arrow_64_by_64};
        }
        for (my $index = 0; $index < scalar(@{$RESOURCE_ARRAY}); $index++) {
            $resourceUtil->addResource($RESOURCE_STRING_ARRAY->[$index]->{RESOURCE}, ("" . ($RESOURCE_ARRAY->[$index])));
        }
}

use org::allbinary::AndroidResources;
use org::allbinary::data::resource::ResourceUtil;
use org::allbinary::init::Init;
use org::allbinary::input::motion::button::CommonButtons;
use org::allbinary::input::motion::button::TouchButtonBlankResource;
use org::allbinary::input::motion::button::TouchButtonDownResource;
use org::allbinary::input::motion::button::TouchButtonGenericActionResource;
use org::allbinary::input::motion::button::TouchButtonResource;
use org::allbinary::input::motion::button::TouchButtonStartResource;
use org::allbinary::input::motion::button::TouchButtonStrafeLeftResource;
use org::allbinary::input::motion::button::TouchButtonStrafeRightResource;
use org::allbinary::input::motion::button::TouchButtonTurnLeftResource;
use org::allbinary::input::motion::button::TouchButtonTurnRightResource;
use org::allbinary::input::motion::button::TouchButtonUpResource;
use org::allbinary::logic::system::os::OperatingSystemFactory;

1;

