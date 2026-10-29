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

package org::allbinary::input::motion::button::TouchScreenTypeFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::input::motion::button::TouchScreenTypeFactory'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::input::motion::button::TouchScreenTypeFactory::instance;
}


sub update {
    my ($self, $activity) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $touchScreenFactory = 'org::allbinary::input::motion::button::TouchScreenFactory'->getInstance();
        my $touchScreenTypesFactory = 'org::allbinary::input::motion::button::TouchScreenTypesFactory'->getInstance();
        my $configuration = $activity->getResources()->getConfiguration();
        my $touchScreen = $configuration->{touchscreen};
        if ($touchScreen == $android::content::res::Configuration::TOUCHSCREEN_FINGER) {
            $touchScreenFactory->setTouchScreenType($touchScreenTypesFactory->{FINGER});
            if (!$touchScreenFactory->isTouch()) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put("Not Really Exception: This indicates that a touch screen does exist but is not API8 so we will try it", $self, $commonStrings->{PROCESS});
                $touchScreenFactory->setTouch(1);
            }
        } elsif ($touchScreen == $android::content::res::Configuration::TOUCHSCREEN_STYLUS) {
            $touchScreenFactory->setTouchScreenType($touchScreenTypesFactory->{STYLUS});
            if (!$touchScreenFactory->isTouch()) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put("Not Really Exception: This indicates that a touch screen does exist but is not API8 so we will try it", $self, $commonStrings->{PROCESS});
                $touchScreenFactory->setTouch(1);
            }
        } elsif ($touchScreen == $android::content::res::Configuration::TOUCHSCREEN_NOTOUCH) {
            $touchScreenFactory->setTouchScreenType($touchScreenTypesFactory->{NOTOUCH});
        } elsif ($touchScreen == $android::content::res::Configuration::TOUCHSCREEN_UNDEFINED) {
            $touchScreenFactory->setTouchScreenType($touchScreenTypesFactory->{UNDEFINED});
        }
}

use android::app::Activity;
use android::content::res::Configuration;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::input::motion::button::TouchScreenFactory;
use org::allbinary::input::motion::button::TouchScreenTypesFactory;

1;

