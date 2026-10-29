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

package org::allbinary::media::graphics::geography::map::racetrack::RaceTrackInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{id} = undef;
    $self->{name} = undef;
    $self->{raceTrackFrictionProperties} = undef;
    $self->{foregroundBasicColor} = undef;
    $self->{backgroundBasicColor} = undef;
    $self->{qualifyTime} = undef;
    $self->{worstContinuePosition} = undef;
    $self->{totalLaps} = undef;
}


sub new {
    my ($class, $id, $name, $raceTrackFrictionProperties, $foregroundBasicColor, $backgroundBasicColor, $qualifyTime, $worstContinuePosition, $totalLaps) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{id} = $id;
        $self->{name} = $name;
        $self->{raceTrackFrictionProperties} = $raceTrackFrictionProperties;
        $self->{backgroundBasicColor} = $backgroundBasicColor;
        $self->{foregroundBasicColor} = $foregroundBasicColor;
        $self->{qualifyTime} = $qualifyTime;
        $self->{worstContinuePosition} = $worstContinuePosition;
        $self->{totalLaps} = $totalLaps;
    return $self;
}


sub getId {
    my ($self) = @_;
        return $self->{id};
}


sub setId {
    my ($self, $id) = @_;
        $self->{id} = $id;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub setName {
    my ($self, $name) = @_;
        $self->{name} = $name;
}


sub getQualifyTime {
    my ($self) = @_;
        return $self->{qualifyTime};
}


sub setQualifyTime {
    my ($self, $qualifyTime) = @_;
        $self->{qualifyTime} = $qualifyTime;
}


sub getWorstContinuePosition {
    my ($self) = @_;
        return $self->{worstContinuePosition};
}


sub setWorstContinuePosition {
    my ($self, $worstContinuePosition) = @_;
        $self->{worstContinuePosition} = $worstContinuePosition;
}


sub getTotalLaps {
    my ($self) = @_;
        return $self->{totalLaps};
}


sub setTotalLaps {
    my ($self, $totalLaps) = @_;
        $self->{totalLaps} = $totalLaps;
}


sub getForegroundBasicColor {
    my ($self) = @_;
        return $self->{foregroundBasicColor};
}


sub setForegroundBasicColor {
    my ($self, $foregroundBasicColor) = @_;
        $self->{foregroundBasicColor} = $foregroundBasicColor;
}


sub getBackgroundBasicColor {
    my ($self) = @_;
        return $self->{backgroundBasicColor};
}


sub setBackgroundBasicColor {
    my ($self, $backgroundBasicColor) = @_;
        $self->{backgroundBasicColor} = $backgroundBasicColor;
}


sub getRaceTrackFrictionProperties {
    my ($self) = @_;
        return $self->{raceTrackFrictionProperties};
}


sub setRaceTrackFrictionProperties {
    my ($self, $raceTrackFrictionProperties) = @_;
        $self->{raceTrackFrictionProperties} = $raceTrackFrictionProperties;
}

use org::allbinary::graphics::color::BasicColor;

1;

