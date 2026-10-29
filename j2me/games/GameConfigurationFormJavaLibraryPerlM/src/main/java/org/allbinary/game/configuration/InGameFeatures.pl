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

package org::allbinary::game::configuration::InGameFeatures;
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
        my $LABEL = "Screen Buttons";
        my $orientationData = 'org::allbinary::input::gyro::OrientationData'->getInstance();
        my $exclusiveOrientationSensorVector = 'org::allbinary::game::configuration::feature::GameFeatureChoiceGroups'->getExclusiveInstance()->get()->get($orientationData->{ORIENTATION_SENSOR_INPUT});
        my $inGameFeatureChoiceGroups = 'org::allbinary::game::configuration::feature::InGameFeatureChoiceGroups'->getExclusiveInstance();
        if (defined($exclusiveOrientationSensorVector)) {
            my $inGameExclusiveOrientationSensorVectorCanBeNull = $inGameFeatureChoiceGroups->get()->get($orientationData->{ORIENTATION_SENSOR_INPUT});
            if (!defined($inGameExclusiveOrientationSensorVectorCanBeNull)) {
                $self->addToInGameMenu();
            } else {
                my $inGameExclusiveOrientationSensorVector = $inGameExclusiveOrientationSensorVectorCanBeNull;
                if ($inGameExclusiveOrientationSensorVector->size() == 0) {
                    $self->addToInGameMenu();
                }
            }
        }
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        if ($features->isFeature('org::allbinary::game::configuration::feature::TouchFeatureFactory'->getInstance()->{SHOW_SCREEN_BUTTONS}) || $features->isFeature('org::allbinary::game::configuration::feature::TouchFeatureFactory'->getInstance()->{AUTO_HIDE_SHOW_SCREEN_BUTTONS}) || $features->isFeature('org::allbinary::game::configuration::feature::TouchFeatureFactory'->getInstance()->{HIDE_SCREEN_BUTTONS})) {
            my $exclusiveScreenButtonsVector = 'org::allbinary::util::BasicArrayListD'->new();
            my $touchFeatureFactory = 'org::allbinary::game::configuration::feature::TouchFeatureFactory'->getInstance();
            $exclusiveScreenButtonsVector->add($touchFeatureFactory->{AUTO_HIDE_SHOW_SCREEN_BUTTONS});
            $exclusiveScreenButtonsVector->add($touchFeatureFactory->{SHOW_SCREEN_BUTTONS});
            $exclusiveScreenButtonsVector->add($touchFeatureFactory->{HIDE_SCREEN_BUTTONS});
            $inGameFeatureChoiceGroups->add($LABEL, $exclusiveScreenButtonsVector);
        }
}


sub addToInGameMenu {
    my ($self) = @_;
        my $orientationData = 'org::allbinary::input::gyro::OrientationData'->getInstance();
        my $inGameExclusiveOrientationSensorVector = 'org::allbinary::util::BasicArrayListD'->new();
        $inGameExclusiveOrientationSensorVector->add('org::allbinary::game::configuration::feature::SensorFeatureFactory'->getInstance()->{ORIENTATION_SENSORS});
        $inGameExclusiveOrientationSensorVector->add('org::allbinary::game::configuration::feature::SensorFeatureFactory'->getInstance()->{NO_ORIENTATION});
        'org::allbinary::game::configuration::feature::InGameFeatureChoiceGroups'->getExclusiveInstance()->add($orientationData->{ORIENTATION_SENSOR_INPUT}, $inGameExclusiveOrientationSensorVector);
}


sub isAny {
    my ($self) = @_;
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        my $touchFeatureFactory = 'org::allbinary::game::configuration::feature::TouchFeatureFactory'->getInstance();
        if ($features->isFeature($touchFeatureFactory->{SHOW_SCREEN_BUTTONS}) || $features->isFeature($touchFeatureFactory->{AUTO_HIDE_SHOW_SCREEN_BUTTONS}) || $features->isFeature($touchFeatureFactory->{HIDE_SCREEN_BUTTONS})) {
            return 1;
        }
        my $exclusiveOrientationSensorVector = 'org::allbinary::game::configuration::feature::GameFeatureChoiceGroups'->getExclusiveInstance()->get()->get('org::allbinary::input::gyro::OrientationData'->getInstance()->{ORIENTATION_SENSOR_INPUT});
        if (defined($exclusiveOrientationSensorVector)) {
            return 1;
        }
        return 0;
}

use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::GameFeatureChoiceGroups;
use org::allbinary::game::configuration::feature::InGameFeatureChoiceGroups;
use org::allbinary::game::configuration::feature::SensorFeatureFactory;
use org::allbinary::game::configuration::feature::TouchFeatureFactory;
use org::allbinary::init::Init;
use org::allbinary::input::gyro::OrientationData;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

