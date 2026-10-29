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

package org::allbinary::game::input::LocalPlayerInputIdFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::input::LocalPlayerInputIdFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{MAX_NUMBER_OF_PLAYERS} = 6;
    $self->{MAX_FAST_DEVICEID} = 65;
    $self->{deviceIdToplayerId} = [(0) x ($self->{MAX_FAST_DEVICEID})];
    $self->{playerIdToDeviceId} = [(0) x ($self->{MAX_NUMBER_OF_PLAYERS})];
    $self->{playersInPlay} = [(0) x ($self->{MAX_NUMBER_OF_PLAYERS})];
    $self->{totalDevicesMapped} = 0;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        for (my $index = scalar(@{$self->{deviceIdToplayerId}}) - 1; $index >= 0; $index--) {
            $self->{deviceIdToplayerId}->[$index] = -1;
        }
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::LocalPlayerInputIdFactory::instance;
}


sub getDeviceId {
    my ($self, $playerInputId) = @_;
        return $self->{playerIdToDeviceId}->[$playerInputId];
}


sub getPlayerForDevice {
    my ($self, $deviceId) = @_;
        my $index = 0;
        if ($deviceId < $self->{MAX_FAST_DEVICEID}) {
            my $playerInputId = $self->{deviceIdToplayerId}->[$deviceId];
            if ($playerInputId != -1) {
                return $playerInputId;
            }
        } else {
            for ($index = $self->{totalDevicesMapped} - 1; $index >= 0; $index--) {
                if ($self->{playerIdToDeviceId}->[$index] == $deviceId) {
                    return $index;
                }
            }
        }
        $index = $self->{totalDevicesMapped};
        if ($deviceId < $self->{MAX_FAST_DEVICEID}) {
            $self->{deviceIdToplayerId}->[$deviceId] = $index;
        } else {
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Added DeviceId: ")->appendint($deviceId)->append(" beyond fast Id list")->toString(), $self, "getPlayerForDevice");
        }
        $self->{playerIdToDeviceId}->[$index] = $deviceId;
        'org::allbinary::game::input::analog::AnalogLocationInputFactory'->getInstance()->addPlayer($self->{totalDevicesMapped});
        $self->{totalDevicesMapped}++;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Added DeviceId: ")->appendint($deviceId)->append(" at: ")->appendint($index)->append(" Total: ")->appendint($self->{totalDevicesMapped})->toString(), $self, "getPlayerForDevice");
        return $index;
}


sub getTotalDevicesInPlay {
    my ($self) = @_;
        my $total = 0;
        for (my $index = $self->{totalDevicesMapped} - 1; $index >= 0; $index--) {
            if ($self->{playersInPlay}->[$index] == 1) {
                $total++;
            }
        }
        return $total;
}


sub isPlayerInPlay {
    my ($self, $playerInputId) = @_;
        return $self->{playersInPlay}->[$playerInputId];
}


sub setPlayerInPlay {
    my ($self, $playerInputId) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Setting PlayerInPlay with playerInputId: ")->appendint($playerInputId)->toString(), $self, "setPlayerInPlay");
        $self->{playersInPlay}->[$playerInputId] = 1;
}


sub setPlayerOutOfPlay {
    my ($self, $playerInputId) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Setting PlayerOutOfPlay with playerInputId: ")->appendint($playerInputId)->toString(), $self, "setPlayerOutOfPlay");
        $self->{playersInPlay}->[$playerInputId] = 0;
}


sub getPlayersInPlay {
    my ($self) = @_;
        return $self->{playersInPlay};
}

use org::allbinary::game::input::analog::AnalogLocationInputFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;

1;

